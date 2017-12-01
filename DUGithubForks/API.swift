//  This file was automatically generated and should not be edited.

import Apollo

public final class GetRepoQuery: GraphQLQuery {
  public static let operationString =
    "query GetRepo($repo_owner: String!, $repo_name: String!) {\n  repository(owner: $repo_owner, name: $repo_name) {\n    __typename\n    ...RepoDetails\n    forks(first: 0, orderBy: {field: NAME, direction: ASC}) {\n      __typename\n      ...ForkDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RepoDetails.fragmentString).appending(ForkDetails.fragmentString) }

  public var repo_owner: String
  public var repo_name: String

  public init(repo_owner: String, repo_name: String) {
    self.repo_owner = repo_owner
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_owner": repo_owner, "repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("repo_owner"), "name": GraphQLVariable("repo_name")], type: .object(Repository.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository.flatMap { $0.snapshot }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
        GraphQLField("forks", arguments: ["first": 0, "orderBy": ["field": "NAME", "direction": "ASC"]], type: .nonNull(.object(Fork.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, owner: Owner, forks: Fork) {
        self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot, "forks": forks.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The User owner of the repository.
      public var owner: Owner {
        get {
          return Owner(snapshot: snapshot["owner"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "owner")
        }
      }

      /// A list of forked repositories.
      public var forks: Fork {
        get {
          return Fork(snapshot: snapshot["forks"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "forks")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var repoDetails: RepoDetails {
          get {
            return RepoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["Organization", "User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return snapshot["login"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "login")
          }
        }

        /// A URL pointing to the owner's public avatar.
        public var avatarUrl: String {
          get {
            return snapshot["avatarUrl"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "avatarUrl")
          }
        }
      }

      public struct Fork: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, pageInfo: PageInfo) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return snapshot["totalCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var forkDetails: ForkDetails {
            get {
              return ForkDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating backwards, are there more items?
          public var hasPreviousPage: Bool {
            get {
              return snapshot["hasPreviousPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasPreviousPage")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return snapshot["startCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "startCursor")
            }
          }
        }
      }
    }
  }
}

public final class RepoFirstForksQuery: GraphQLQuery {
  public static let operationString =
    "query RepoFirstForks($repo_owner: String!, $repo_name: String!, $forks_count: Int!) {\n  repository(owner: $repo_owner, name: $repo_name) {\n    __typename\n    ...RepoDetails\n    forks(first: $forks_count, orderBy: {field: NAME, direction: ASC}) {\n      __typename\n      ...RepoConnectionDetails\n      nodes {\n        __typename\n        ...RepoDetails\n        forks(first: 0, orderBy: {field: NAME, direction: ASC}) {\n          __typename\n          ...ForkDetails\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RepoDetails.fragmentString).appending(RepoConnectionDetails.fragmentString).appending(ForkDetails.fragmentString) }

  public var repo_owner: String
  public var repo_name: String
  public var forks_count: Int

  public init(repo_owner: String, repo_name: String, forks_count: Int) {
    self.repo_owner = repo_owner
    self.repo_name = repo_name
    self.forks_count = forks_count
  }

  public var variables: GraphQLMap? {
    return ["repo_owner": repo_owner, "repo_name": repo_name, "forks_count": forks_count]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("repo_owner"), "name": GraphQLVariable("repo_name")], type: .object(Repository.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository.flatMap { $0.snapshot }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
        GraphQLField("forks", arguments: ["first": GraphQLVariable("forks_count"), "orderBy": ["field": "NAME", "direction": "ASC"]], type: .nonNull(.object(Fork.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, owner: Owner, forks: Fork) {
        self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot, "forks": forks.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The User owner of the repository.
      public var owner: Owner {
        get {
          return Owner(snapshot: snapshot["owner"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "owner")
        }
      }

      /// A list of forked repositories.
      public var forks: Fork {
        get {
          return Fork(snapshot: snapshot["forks"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "forks")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var repoDetails: RepoDetails {
          get {
            return RepoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["Organization", "User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return snapshot["login"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "login")
          }
        }

        /// A URL pointing to the owner's public avatar.
        public var avatarUrl: String {
          get {
            return snapshot["avatarUrl"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "avatarUrl")
          }
        }
      }

      public struct Fork: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot, "nodes": nodes.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return snapshot["totalCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (snapshot["nodes"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var repoConnectionDetails: RepoConnectionDetails {
            get {
              return RepoConnectionDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public var forkDetails: ForkDetails {
            get {
              return ForkDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating backwards, are there more items?
          public var hasPreviousPage: Bool {
            get {
              return snapshot["hasPreviousPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasPreviousPage")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return snapshot["startCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("forks", arguments: ["first": 0, "orderBy": ["field": "NAME", "direction": "ASC"]], type: .nonNull(.object(Fork.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, owner: Owner, forks: Fork) {
            self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot, "forks": forks.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(snapshot: snapshot["owner"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "owner")
            }
          }

          /// A list of forked repositories.
          public var forks: Fork {
            get {
              return Fork(snapshot: snapshot["forks"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "forks")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var repoDetails: RepoDetails {
              get {
                return RepoDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes = ["Organization", "User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
              return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
              return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the owner's public avatar.
            public var avatarUrl: String {
              get {
                return snapshot["avatarUrl"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }

          public struct Fork: GraphQLSelectionSet {
            public static let possibleTypes = ["RepositoryConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int, pageInfo: PageInfo) {
              self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }

            /// Information to aid in pagination.
            public var pageInfo: PageInfo {
              get {
                return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var forkDetails: ForkDetails {
                get {
                  return ForkDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct PageInfo: GraphQLSelectionSet {
              public static let possibleTypes = ["PageInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("endCursor", type: .scalar(String.self)),
                GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("startCursor", type: .scalar(String.self)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
                self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// When paginating forwards, the cursor to continue.
              public var endCursor: String? {
                get {
                  return snapshot["endCursor"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "endCursor")
                }
              }

              /// When paginating forwards, are there more items?
              public var hasNextPage: Bool {
                get {
                  return snapshot["hasNextPage"]! as! Bool
                }
                set {
                  snapshot.updateValue(newValue, forKey: "hasNextPage")
                }
              }

              /// When paginating backwards, are there more items?
              public var hasPreviousPage: Bool {
                get {
                  return snapshot["hasPreviousPage"]! as! Bool
                }
                set {
                  snapshot.updateValue(newValue, forKey: "hasPreviousPage")
                }
              }

              /// When paginating backwards, the cursor to continue.
              public var startCursor: String? {
                get {
                  return snapshot["startCursor"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "startCursor")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class RepoNextForksQuery: GraphQLQuery {
  public static let operationString =
    "query RepoNextForks($repo_owner: String!, $repo_name: String!, $forks_count: Int!, $end_cursor: String!) {\n  repository(owner: $repo_owner, name: $repo_name) {\n    __typename\n    ...RepoDetails\n    forks(first: $forks_count, orderBy: {field: NAME, direction: ASC}, after: $end_cursor) {\n      __typename\n      ...RepoConnectionDetails\n      nodes {\n        __typename\n        ...RepoDetails\n        forks(first: 0, orderBy: {field: NAME, direction: ASC}) {\n          __typename\n          ...ForkDetails\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(RepoDetails.fragmentString).appending(RepoConnectionDetails.fragmentString).appending(ForkDetails.fragmentString) }

  public var repo_owner: String
  public var repo_name: String
  public var forks_count: Int
  public var end_cursor: String

  public init(repo_owner: String, repo_name: String, forks_count: Int, end_cursor: String) {
    self.repo_owner = repo_owner
    self.repo_name = repo_name
    self.forks_count = forks_count
    self.end_cursor = end_cursor
  }

  public var variables: GraphQLMap? {
    return ["repo_owner": repo_owner, "repo_name": repo_name, "forks_count": forks_count, "end_cursor": end_cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("repo_owner"), "name": GraphQLVariable("repo_name")], type: .object(Repository.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository.flatMap { $0.snapshot }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
        GraphQLField("forks", arguments: ["first": GraphQLVariable("forks_count"), "orderBy": ["field": "NAME", "direction": "ASC"], "after": GraphQLVariable("end_cursor")], type: .nonNull(.object(Fork.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, owner: Owner, forks: Fork) {
        self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot, "forks": forks.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The User owner of the repository.
      public var owner: Owner {
        get {
          return Owner(snapshot: snapshot["owner"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "owner")
        }
      }

      /// A list of forked repositories.
      public var forks: Fork {
        get {
          return Fork(snapshot: snapshot["forks"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "forks")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var repoDetails: RepoDetails {
          get {
            return RepoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["Organization", "User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
          return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return snapshot["login"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "login")
          }
        }

        /// A URL pointing to the owner's public avatar.
        public var avatarUrl: String {
          get {
            return snapshot["avatarUrl"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "avatarUrl")
          }
        }
      }

      public struct Fork: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot, "nodes": nodes.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return snapshot["totalCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (snapshot["nodes"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var repoConnectionDetails: RepoConnectionDetails {
            get {
              return RepoConnectionDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public var forkDetails: ForkDetails {
            get {
              return ForkDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return snapshot["hasNextPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating backwards, are there more items?
          public var hasPreviousPage: Bool {
            get {
              return snapshot["hasPreviousPage"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "hasPreviousPage")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return snapshot["startCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("forks", arguments: ["first": 0, "orderBy": ["field": "NAME", "direction": "ASC"]], type: .nonNull(.object(Fork.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, owner: Owner, forks: Fork) {
            self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot, "forks": forks.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(snapshot: snapshot["owner"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "owner")
            }
          }

          /// A list of forked repositories.
          public var forks: Fork {
            get {
              return Fork(snapshot: snapshot["forks"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "forks")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var repoDetails: RepoDetails {
              get {
                return RepoDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes = ["Organization", "User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
              return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
              return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the owner's public avatar.
            public var avatarUrl: String {
              get {
                return snapshot["avatarUrl"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }

          public struct Fork: GraphQLSelectionSet {
            public static let possibleTypes = ["RepositoryConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int, pageInfo: PageInfo) {
              self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }

            /// Information to aid in pagination.
            public var pageInfo: PageInfo {
              get {
                return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var forkDetails: ForkDetails {
                get {
                  return ForkDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct PageInfo: GraphQLSelectionSet {
              public static let possibleTypes = ["PageInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("endCursor", type: .scalar(String.self)),
                GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("startCursor", type: .scalar(String.self)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
                self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// When paginating forwards, the cursor to continue.
              public var endCursor: String? {
                get {
                  return snapshot["endCursor"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "endCursor")
                }
              }

              /// When paginating forwards, are there more items?
              public var hasNextPage: Bool {
                get {
                  return snapshot["hasNextPage"]! as! Bool
                }
                set {
                  snapshot.updateValue(newValue, forKey: "hasNextPage")
                }
              }

              /// When paginating backwards, are there more items?
              public var hasPreviousPage: Bool {
                get {
                  return snapshot["hasPreviousPage"]! as! Bool
                }
                set {
                  snapshot.updateValue(newValue, forKey: "hasPreviousPage")
                }
              }

              /// When paginating backwards, the cursor to continue.
              public var startCursor: String? {
                get {
                  return snapshot["startCursor"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "startCursor")
                }
              }
            }
          }
        }
      }
    }
  }
}

public struct RepoConnectionDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment RepoConnectionDetails on RepositoryConnection {\n  __typename\n  ...ForkDetails\n  nodes {\n    __typename\n    ...RepoDetails\n  }\n}"

  public static let possibleTypes = ["RepositoryConnection"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
    GraphQLField("nodes", type: .list(.object(Node.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(totalCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
    self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot, "nodes": nodes.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Identifies the total count of items in the connection.
  public var totalCount: Int {
    get {
      return snapshot["totalCount"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "totalCount")
    }
  }

  /// Information to aid in pagination.
  public var pageInfo: PageInfo {
    get {
      return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
    }
  }

  /// A list of nodes.
  public var nodes: [Node?]? {
    get {
      return (snapshot["nodes"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(snapshot: snapshot)
    }
    set {
      snapshot += newValue.snapshot
    }
  }

  public struct Fragments {
    public var snapshot: Snapshot

    public var forkDetails: ForkDetails {
      get {
        return ForkDetails(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }
  }

  public struct PageInfo: GraphQLSelectionSet {
    public static let possibleTypes = ["PageInfo"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("endCursor", type: .scalar(String.self)),
      GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("startCursor", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
      self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// When paginating forwards, the cursor to continue.
    public var endCursor: String? {
      get {
        return snapshot["endCursor"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "endCursor")
      }
    }

    /// When paginating forwards, are there more items?
    public var hasNextPage: Bool {
      get {
        return snapshot["hasNextPage"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "hasNextPage")
      }
    }

    /// When paginating backwards, are there more items?
    public var hasPreviousPage: Bool {
      get {
        return snapshot["hasPreviousPage"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "hasPreviousPage")
      }
    }

    /// When paginating backwards, the cursor to continue.
    public var startCursor: String? {
      get {
        return snapshot["startCursor"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "startCursor")
      }
    }
  }

  public struct Node: GraphQLSelectionSet {
    public static let possibleTypes = ["Repository"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, owner: Owner) {
      self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    /// The name of the repository.
    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    /// The User owner of the repository.
    public var owner: Owner {
      get {
        return Owner(snapshot: snapshot["owner"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "owner")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var repoDetails: RepoDetails {
        get {
          return RepoDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Owner: GraphQLSelectionSet {
      public static let possibleTypes = ["Organization", "User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
        return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
      }

      public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
        return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return snapshot["login"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login")
        }
      }

      /// A URL pointing to the owner's public avatar.
      public var avatarUrl: String {
        get {
          return snapshot["avatarUrl"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "avatarUrl")
        }
      }
    }
  }
}

public struct RepoDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment RepoDetails on Repository {\n  __typename\n  id\n  name\n  owner {\n    __typename\n    id\n    login\n    avatarUrl\n  }\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String, owner: Owner) {
    self.init(snapshot: ["__typename": "Repository", "id": id, "name": name, "owner": owner.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(snapshot: snapshot["owner"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "owner")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("login", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
      return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
    }

    public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
      return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    /// The username used to login.
    public var login: String {
      get {
        return snapshot["login"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "login")
      }
    }

    /// A URL pointing to the owner's public avatar.
    public var avatarUrl: String {
      get {
        return snapshot["avatarUrl"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "avatarUrl")
      }
    }
  }
}

public struct ForkDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment ForkDetails on RepositoryConnection {\n  __typename\n  totalCount\n  pageInfo {\n    __typename\n    endCursor\n    hasNextPage\n    hasPreviousPage\n    startCursor\n  }\n}"

  public static let possibleTypes = ["RepositoryConnection"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(totalCount: Int, pageInfo: PageInfo) {
    self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Identifies the total count of items in the connection.
  public var totalCount: Int {
    get {
      return snapshot["totalCount"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "totalCount")
    }
  }

  /// Information to aid in pagination.
  public var pageInfo: PageInfo {
    get {
      return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
    }
  }

  public struct PageInfo: GraphQLSelectionSet {
    public static let possibleTypes = ["PageInfo"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("endCursor", type: .scalar(String.self)),
      GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("startCursor", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
      self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// When paginating forwards, the cursor to continue.
    public var endCursor: String? {
      get {
        return snapshot["endCursor"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "endCursor")
      }
    }

    /// When paginating forwards, are there more items?
    public var hasNextPage: Bool {
      get {
        return snapshot["hasNextPage"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "hasNextPage")
      }
    }

    /// When paginating backwards, are there more items?
    public var hasPreviousPage: Bool {
      get {
        return snapshot["hasPreviousPage"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "hasPreviousPage")
      }
    }

    /// When paginating backwards, the cursor to continue.
    public var startCursor: String? {
      get {
        return snapshot["startCursor"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "startCursor")
      }
    }
  }
}