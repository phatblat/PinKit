import Foundation

/// Model for a single post.
struct Post: Codable {
    let description: String
    let extended: String
    let hash: String
    let href: URL
    let meta: String
    let shared: Bool
    let tags: String
    let time: Date
    let toread: Bool
}

/*
    {
    "description": "kharrison/CodeExamples",
    "extended": "",
    "hash": "010be83659b240bd514486b7b55c6286",
    "href": "https://github.com/kharrison/CodeExamples",
    "meta": "68e10fdee4ceaaf89fe844b729e1778c",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-24T01:10:17Z",
    "toread": "yes"
    },
    {
    "description": "Supporting Dark Mode In WKWebView",
    "extended": "",
    "hash": "40d6c3b533725208f1a2ec0178a63e2b",
    "href": "https://useyourloaf.com/blog/supporting-dark-mode-in-wkwebview/",
    "meta": "11119452b64b6ddd8fbe7ea9cff08f7d",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-24T00:59:24Z",
    "toread": "yes"
    },
    {
    "description": "www.theatlantic.com",
    "extended": "",
    "hash": "d90c4c93b8adab39c9e94fff1c4dde4d",
    "href": "https://www.theatlantic.com/politics/archive/2020/04/coronavirus-pandemic-privacy-civil-liberties-911/609172/",
    "meta": "f01672d9194c3c80a52a985c51e04951",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-24T00:07:47Z",
    "toread": "no"
    },
    {
    "description": "www.google.com",
    "extended": "",
    "hash": "a76fe29b11b35fd0ca64778eb09c185c",
    "href": "https://www.pocket-lint.com/apps/news/151711-best-zoom-backgrounds-fun-virtual-backgrounds-for-zoom-meetings",
    "meta": "0c3b7b7ce2a3672bc73b7c2f9a30b989",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T23:20:35Z",
    "toread": "no"
    },
    {
    "description": "kylehickinson/SwiftUI-WebView",
    "extended": "",
    "hash": "ec3cd608ef046b30a8bc6c2d3a826935",
    "href": "https://github.com/kylehickinson/SwiftUI-WebView",
    "meta": "bd1ec9890280c07eff35439626c89a6b",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T22:06:50Z",
    "toread": "yes"
    },
    {
    "description": "www.indiegogo.com",
    "extended": "",
    "hash": "3d50a2e840fa2ff9fcd13da5600b236f",
    "href": "https://www.indiegogo.com/projects/ticktime-countdown-manage-time-like-never-before/x/830578#/",
    "meta": "c845bdaab53e14ad71d2f0c0a64cabf4",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T21:03:42Z",
    "toread": "no"
    },
    {
    "description": "git clone | Atlassian Git Tutorial",
    "extended": "",
    "hash": "d175882545bf727b49517b7c237442a1",
    "href": "https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-clone",
    "meta": "d26c929fa140cd0749453fe13c198315",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T20:30:50Z",
    "toread": "yes"
    },
    {
    "description": "Apple invites select developers to attend accessibility webinar ahead of WWDC 2020",
    "extended": "",
    "hash": "8d479b99906d34a4b633a5ede6ca617a",
    "href": "https://9to5mac.com/2020/04/20/accessibility-webinar/",
    "meta": "55db9986c088e4eb2b573d63724e08e9",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T16:35:28Z",
    "toread": "yes"
    },
    {
    "description": "Share Everywhere",
    "extended": "",
    "hash": "6392f394b684c976672bea375d0332fe",
    "href": "https://shareeverywhere.epic.com/FAQ",
    "meta": "6ddc2e123f191c97e28901923146f40a",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T16:07:42Z",
    "toread": "yes"
    },
    {
    "description": "Kaiser Permanente Addresses COVID-19’s Effects on Mental Health, Offers Free myStrength Mental Health App",
    "extended": "",
    "hash": "8777977958dcc765a12a3dffe10c663a",
    "href": "https://www.diversityinc.com/kaiser-permanente-addresses-covid-19s-effects-on-mental-health-offers-free-mystrength-mental-health-app/",
    "meta": "973991dd5fa26dacb40048d52e8510cb",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T16:05:34Z",
    "toread": "yes"
    },
    {
    "description": "Confluence Voting",
    "extended": "",
    "hash": "0e0fd2f70c71cd0f1021ec8dd829edf6",
    "href": "https://cprime.com/2016/07/confluence-voting",
    "meta": "6adc18cd0f6cd08eb3b848bb9f6dcbee",
    "shared": "yes",
    "tags": "Unread",
    "time": "2020-04-23T06:05:05Z",
    "toread": "no"
    },
    {
    "description": "www.cprime.com",
    "extended": "",
    "hash": "108c1be8ca5e1fe58f55d969462544ab",
    "href": "https://www.cprime.com/2016/07/confluence-voting/",
    "meta": "dd54d692c2628d41cb575f120ed5352a",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T06:00:45Z",
    "toread": "no"
    },
    {
    "description": "Ruby Optimization with One Magic Comment",
    "extended": "",
    "hash": "a00676184cea7fd31553354f95c83f53",
    "href": "https://www.mikeperham.com/2018/02/28/ruby-optimization-with-one-magic-comment/",
    "meta": "f3f784a0056e738756bf1c739e528ba6",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T01:47:15Z",
    "toread": "yes"
    },
    {
    "description": "RFC 8252 - OAuth 2.0 for Native Apps",
    "extended": "",
    "hash": "ab8fae1611e7f34b5e04e663ed9e51b3",
    "href": "https://tools.ietf.org/html/rfc8252",
    "meta": "f4e38435387115c5e29d6a4887a64a53",
    "shared": "yes",
    "tags": "",
    "time": "2020-04-23T00:50:20Z",
    "toread": "yes"
    }
    ],
    "user": "phatblat"
*/
