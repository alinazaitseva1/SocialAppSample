//
//  JSONResponce.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 10/5/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation


class JSONResponce {
    
    static let userProfileInfo = """
    {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null,
          "age": 32,
          "location": {
            "country": "USA",
            "address": "7-th lane 46"
          },
          "is_online": true,
          "counters": {
            "friends": 100,
            "followers": 1356,
            "tags": 125,
            "posts": 18,
            "photos": 189,
            "videos": 2
          },
          "connection_type": "friends",
          "is_follower": false,
          "is_following": true
    }
"""
    
    static let myProfileInfo = """
    {
          "id": 13,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null,
          "age": 3,
          "location": {
            "country": "Ukraine",
            "address": "7-th lane 46"
          },
          "is_online": true,
          "counters": {
            "friends": 300,
            "followers": 1956,
            "tags": 195,
            "posts": 13,
            "photos": 19,
            "videos": 14
          },
          "connection_type": "friends",
          "is_follower": false,
          "is_following": true
    }
"""
    
    static let userPostsInfo = """
    [
      {
        "id": 3,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-25T12:45:12",
        "body": {
          "text": "First post",
          "attachment": null
        }
      },
      {
        "id": 2,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
      {
        "id": 1,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-14T12:45:12",
        "body": {
          "text": "Third post",
          "attachment": {
            "type": "photo",
            "value": "https://leader.pubs.asha.org/data/Journals/ASHANL/934378/NIB1_web.png"
          }
        }
      }
    ]
    """
    
    static let myPostsInfo = """
    {
    "prev" : null,
    "next" : ""
    "results" :
    [
      {
        "id": 3,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-25T12:45:12",
        "body": {
          "text": "First post",
          "attachment": null
        }
      },
      {
        "id": 2,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
      {
        "id": 1,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-14T12:45:12",
        "body": {
          "text": "Third post",
          "attachment": {
            "type": "photo",
            "value": "https://leader.pubs.asha.org/data/Journals/ASHANL/934378/NIB1_web.png"
          }
        }
      },
    {
        "id": 4,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
    {
        "id": 5,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
    {
        "id": 6,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
    {
        "id": 7,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
    {
        "id": 8,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
    ]
    }
    """
}
