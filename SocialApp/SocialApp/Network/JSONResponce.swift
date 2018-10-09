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
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null,
          "age": 26,
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
    {
    "count": 3,
    "results":
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
          "text": "Third post: Hurricane Hazel was the deadliest and costliest hurricane of the 1954 Atlantic hurricane season. The storm was named by the US Weather Bureau on October 5. In Haiti, 40% of the coffee trees and 50% of the cacao crop were lost, and at least 400 people were killed. Hazel struck North Carolina near Calabash on October 15 as a Category 4 hurricane. It destroyed most of the waterfront dwellings near its point of impact, including about 80% of those in Myrtle Beach, South Carolina.",
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
          "text": "Second post: Hurricane Hazel was the deadliest and costliest hurricane of the 1954 Atlantic hurricane season. The storm was named by the US Weather Bureau on October 5. In Haiti, 40% of the coffee trees and 50% of the cacao crop were lost, and at least 400 people were killed. Hazel struck North Carolina near Calabash on October 15 as a Category 4 hurricane. It destroyed most of the waterfront dwellings near its point of impact, including about 80% of those in Myrtle Beach, South Carolina. Heading north along the Atlantic coast of the United States, it caused $281 million in damage and 95 fatalities.",
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
          "text": "First post: I know in user defaults we can store a value for a particular key and retrieve it but i would like to know how to save multiple values. like the key should be the email_id i have mentioned above and all the three fields should be its values, also i need to maintain all the details even if there is n number of users.",
          "attachment": {
            "type": "photo",
            "value": "https://m.media-amazon.com/images/S/aplus-media/vc/823f05b3-747a-4c3d-a79e-deacbcddf083._SR300,300_.jpg"
          }
        }
      }
    ]
    }
    """
    
    static let myPostsInfo = """
    {
    "count": 8,
    "prev": null,
    "next": "",
    "results":
    [
      {
        "id": 3,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-25T12:45:12",
        "body": {
          "text": "Third post: You first need to create an instance of your setup controller. Assuming the name of your view controller is nameOfMySetupController, do the following: let setupController. In my humble opinion it would help if you learn some of the basics of Swift / iOS programming before diving into coding.",
          "attachment": null
        }
      },
      {
        "id": 2,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post: You could try using a protocol, and delegate, using this method will give you the opportunity to not only present alerts but could give you a better interaction with your view controller in case that you need it on the future.",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
      {
        "id": 1,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-14T12:45:12",
        "body": {
          "text": "First post: Another way to do this is to declare a protocol and a delegate property in the table view cell class, set the controller as the cells delegate and implement the protocol in the controller which is able to present the alert view controller.",
          "attachment": {
            "type": "photo",
            "value": "https://m.media-amazon.com/images/S/aplus-media/vc/823f05b3-747a-4c3d-a79e-deacbcddf083._SR300,300_.jpg"
          }
        }
      },
    {
        "id": 4,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Fourth post: And just like this you can create multiple functions that adapt your need in relation with communication with your viewController or viewControllers",
          "attachment": {
             "type": "photo",
             "value": "https://leader.pubs.asha.org/data/Journals/ASHANL/934378/NIB1_web.png"
          }
        }
      },
    {
        "id": 5,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Fifth post: You have to add your alertViewController to your TableViewController not the cell itself. But as you want the alert view to show once the user touches a cell just implement tableViewDidselectRow and present your alertView from the",
          "attachment": {
            "type": "url",
            "value": "https://www.wikipedia.org/"
          }
        }
      },
    {
        "id": 6,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Sixth post: I am new to ios development. I want to load large amount of data in tableview using pagination.when new page is loaded i am appending data to and reloading the tableview , but it seems not a good way of loading more data.I could not be able to find a good solution in swift.",
          "attachment": {
             "type": "video",
            "value": "5BPrTJ0iuOE"
          }
        }
      },
    {
        "id": 7,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Seventh post: This answer is a bit incomplete but seems to be the correct method. How would I go about creating the custom header view with a unique id in the first place? Currently I've seen a lot of methods online that just use a custom created cell that returns the content view of that cell. Would it be possible for you to expand a bit?",
          "attachment": {
            "type": "video",
            "value": "K1tmZhuuyt0"
          }
        }
      },
    {
        "id": 8,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Eigth post: I know in user defaults we can store a value for a particular key and retrieve it but i would like to know how to save multiple values. like the key should be the email_id i have mentioned above and all the three fields should be its values, also i need to maintain all the details even if there is n number of users.",
          "attachment": {
            "type": "photo",
            "value": "https://revistadiners.com.co/wp-content/uploads/2016/03/homero_800x669.jpg"
          }
        }
      }
    ]
    }
    """
}
