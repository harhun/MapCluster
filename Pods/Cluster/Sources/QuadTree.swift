import MapKit

protocol AnnotationsContainer {
    func add(_ annotation: MKAnnotation) -> Bool
    func remove(_ annotation: MKAnnotation) -> Bool
    func annotations(in rect: MKMapRect) -> [MKAnnotation]
}

class QuadTreeNode {
    enum NodeType {
        case leaf
        case `internal`(children: Children)
    }

    struct Children: Sequence {
        let northWest: QuadTreeNode
        let northEast: QuadTreeNode
        let southWest: QuadTreeNode
        let southEast: QuadTreeNode

        init(parentNode: QuadTreeNode) {
            let mapRect = parentNode.rect
            self.northWest = QuadTreeNode(rect: MKMapRect(minX: mapRect.minX, minY: mapRect.minY, maxX: mapRect.midX, maxY: mapRect.midY))
            self.northEast = QuadTreeNode(rect: MKMapRect(minX: mapRect.midX, minY: mapRect.minY, maxX: mapRect.maxX, maxY: mapRect.midY))
            self.southWest = QuadTreeNode(rect: MKMapRect(minX: mapRect.minX, minY: mapRect.midY, maxX: mapRect.midX, maxY: mapRect.maxY))
            self.southEast = QuadTreeNode(rect: MKMapRect(minX: mapRect.midX, minY: mapRect.midY, maxX: mapRect.maxX, maxY: mapRect.maxY))
        }

        struct ChildrenIterator: IteratorProtocol {
            private var index = 0
            private let children: Children

            init(children: Children) {
                self.children = children
            }

            mutating func next() -> QuadTreeNode? {
                defer { index += 1 }
                switch self.index {
                case 0: return self.children.northWest
                case 1: return self.children.northEast
                case 2: return self.children.southWest
                case 3: return self.children.southEast
                default: return nil
                }
            }
        }

        public func makeIterator() -> ChildrenIterator {
            ChildrenIterator(children: self)
        }
    }

    var annotations = [MKAnnotation]()
    let rect: MKMapRect
    var type: NodeType = .leaf

    static let maxPointCapacity = 8

    init(rect: MKMapRect) {
        self.rect = rect
    }
}

extension QuadTreeNode: AnnotationsContainer {
    @discardableResult
    func add(_ annotation: MKAnnotation) -> Bool {
        guard self.rect.contains(annotation.coordinate) else { return false }

        switch self.type {
        case .leaf:
            self.annotations.append(annotation)
            // if the max capacity was reached, become an internal node
            if self.annotations.count == QuadTreeNode.maxPointCapacity {
                self.subdivide()
            }
        case .internal(let children):
            // pass the point to one of the children
            for child in children where child.add(annotation) {
                return true
            }

            assertionFailure("rect.contains evaluted to true, but none of the children added the annotation")
        }
        return true
    }

    @discardableResult
    func remove(_ annotation: MKAnnotation) -> Bool {
        guard self.rect.contains(annotation.coordinate) else { return false }

        _ = self.annotations.map { $0.coordinate }.firstIndex(of: annotation.coordinate).map { annotations.remove(at: $0) }

        switch self.type {
        case .leaf: break
        case .internal(let children):
            // pass the point to one of the children
            for child in children where child.remove(annotation) {
                return true
            }

            assertionFailure("rect.contains evaluted to true, but none of the children removed the annotation")
        }
        return true
    }

    private func subdivide() {
        switch self.type {
        case .leaf:
            self.type = .internal(children: Children(parentNode: self))
        case .internal:
            preconditionFailure("Calling subdivide on an internal node")
        }
    }

    func annotations(in rect: MKMapRect) -> [MKAnnotation] {
        guard self.rect.intersects(rect) else { return [] }

        var result = [MKAnnotation]()

        for annotation in self.annotations where rect.contains(annotation.coordinate) {
            result.append(annotation)
        }

        switch self.type {
        case .leaf: break
        case .internal(let children):
            for childNode in children {
                result.append(contentsOf: childNode.annotations(in: rect))
            }
        }

        return result
    }
}

public class QuadTree: AnnotationsContainer {
    let root: QuadTreeNode

    public init(rect: MKMapRect) {
        self.root = QuadTreeNode(rect: rect)
    }

    @discardableResult
    public func add(_ annotation: MKAnnotation) -> Bool {
        self.root.add(annotation)
    }

    @discardableResult
    public func remove(_ annotation: MKAnnotation) -> Bool {
        self.root.remove(annotation)
    }

    public func annotations(in rect: MKMapRect) -> [MKAnnotation] {
        self.root.annotations(in: rect)
    }
}
