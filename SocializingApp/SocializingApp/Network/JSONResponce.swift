//
//  JSONResponce.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class JSONResponce {
    
    static let usersProfileInfo = """
   {
   "count":4,
   "results":
    [
      {
         "id":12,
         "avatar":"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
         "first_name":"John",
         "last_name":"Smith",
         "username":null,
         "age":32,
         "location":{
            "country":"USA",
            "address":"7-th lane 46"
         },
         "is_online":true,
         "counters":{
            "friends":100,
            "followers":1356,
            "tags":125,
            "posts":18,
            "photos":189,
            "videos":2
         },
         "connection_type":"friends",
         "is_follower":false,
         "is_following":true
      },
    {
         "id":14,
         "avatar":"https://www.dhresource.com/0x0s/f2-albu-g4-M01-6A-A0-rBVaEVd22X6ACqVoAADGBvQANS8795.jpg/robe-10size.jpg",
         "first_name":"Harry",
         "last_name":"Potter",
         "username":null,
         "age":32,
         "location":{
            "country":"USA",
            "address":"7-th lane 46"
         },
         "is_online":true,
         "counters":{
            "friends":888,
            "followers":1356,
            "tags":125,
            "posts":18,
            "photos":189,
            "videos":21
         },
         "connection_type":"friends",
         "is_follower":false,
         "is_following":true
      },
    {
         "id":15,
         "avatar":"https://manofactionfigures.com/sites/default/files/imagecache/product_full/sites/default/files/lord_voldemort.jpg",
         "first_name":"Lord",
         "last_name":"Voldemort",
         "username":null,
         "age":72,
         "location":{
            "country":"USA",
            "address":"15-th lane 15"
         },
         "is_online":true,
         "counters":{
            "friends":0,
            "followers":1956,
            "tags":125,
            "posts":18,
            "photos":189,
            "videos":12
         },
         "connection_type":"friends",
         "is_follower":false,
         "is_following":true
      },
    {
         "id":16,
         "avatar":"https://revistadiners.com.co/wp-content/uploads/2016/03/homero_800x669.jpg",
         "first_name":"Homer",
         "last_name":"Simpson",
         "username":null,
         "age":38,
         "location":{
            "country":"USA",
            "address":"16-th lane 16"
         },
         "is_online":true,
         "counters":{
            "friends":999,
            "followers":1356,
            "tags":125,
            "posts":18,
            "photos":189,
            "videos":32
         },
         "connection_type":"friends",
         "is_follower":false,
         "is_following":true
      }
    ]
}
"""
    
    static let myProfileInfo = """
    {
    "count":1,
    "results":
    [
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
  ]
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
    
    static let allPostsInfo = """
    {
    "count": 15,
    "prev": null,
    "next": "",
    "results":
    [
      {
        "id": 1,
        "author": {
          "id": 15,
          "avatar": "https://manofactionfigures.com/sites/default/files/imagecache/product_full/sites/default/files/lord_voldemort.jpg",
          "first_name": "Lord",
          "last_name": "Voldemort",
          "username": null
        },
        "created": "2018-09-25T12:45:12",
        "body": {
          "text": "First post: You first need to create an instance of your setup controller. Assuming the name of your view controller is nameOfMySetupController, do the following: let setupController. In my humble opinion it would help if you learn some of the basics of Swift / iOS programming before diving into coding.",
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
        "id": 3,
        "author": {
          "id": 13,
          "avatar": "https://i.pinimg.com/236x/03/c8/36/03c83684d46c50fbf688889d72760eda.jpg",
          "first_name": "Alina",
          "last_name": "Zaitseva",
          "username": null
        },
        "created": "2018-09-14T12:45:12",
        "body": {
          "text": "Third post: Another way to do this is to declare a protocol and a delegate property in the table view cell class, set the controller as the cells delegate and implement the protocol in the controller which is able to present the alert view controller.",
          "attachment": {
            "type": "photo",
            "value": "https://m.media-amazon.com/images/S/aplus-media/vc/823f05b3-747a-4c3d-a79e-deacbcddf083._SR300,300_.jpg"
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
      },
    {
        "id": 9,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Nith post: When Jamestown was established in 1607, Smith trained the first settlers to farm and work, thus saving the colony from early devastation. He publicly stated He that will not work, shall not eat, equivalent to the 2nd Thessalonians 3:10 in the Bible. Harsh weather, lack of food and water, the surrounding swampy wilderness, and attacks from local Indians almost destroyed the colony. With Smith's leadership, however, Jamestown survived and eventually flourished. Smith was forced to return to England after being injured by an accidental explosion of gunpowder in a canoe.",
          "attachment": {
            "type": "photo",
            "value": "https://static.tvtropes.org/pmwiki/pub/images/margesimpson_1431.jpg"
          }
        }
      },
    {
        "id": 10,
        "author": {
          "id": 16,
          "avatar": "https://revistadiners.com.co/wp-content/uploads/2016/03/homero_800x669.jpg",
          "first_name": "Homer",
          "last_name": "Simpson",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Tenth post: When Jamestown was established in 1607, Smith trained the first settlers to farm and work, thus saving the colony from early devastation. He publicly stated He that will not work, shall not eat, equivalent to the 2nd Thessalonians 3:10 in the Bible. Harsh weather, lack of food and water, the surrounding swampy wilderness, and attacks from local Indians almost destroyed the colony. With Smith's leadership, however, Jamestown survived and eventually flourished. Smith was forced to return to England after being injured by an accidental explosion of gunpowder in a canoe.",
          "attachment": {
            "type": "photo",
            "value": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi2dIib96enpWx3lFpkK1cDx5snUd-VrS0FHk1xWjHI1082spn"
          }
        }
      },
    {
        "id": 11,
        "author": {
          "id": 16,
          "avatar": "https://revistadiners.com.co/wp-content/uploads/2016/03/homero_800x669.jpg",
          "first_name": "Homer",
          "last_name": "Simpson",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Eleventh post: I know in user defaults we can store a value for a particular key and retrieve it but i would like to know how to save multiple values. like the key should be the email_id i have mentioned above and all the three fields should be its values, also i need to maintain all the details even if there is n number of users.",
          "attachment": {
            "type": "photo",
            "value": "https://i.pinimg.com/originals/5e/c7/a0/5ec7a0f704731d1988cbec6f6845a76e.jpg"
          }
        }
      },
    {
        "id": 12,
        "author": {
          "id": 16,
          "avatar": "https://revistadiners.com.co/wp-content/uploads/2016/03/homero_800x669.jpg",
          "first_name": "Homer",
          "last_name": "Simpson",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Twelfth post: I know in user defaults we can store a value for a particular key and retrieve it but i would like to know how to save multiple values. like the key should be the email_id i have mentioned above and all the three fields should be its values, also i need to maintain all the details even if there is n number of users.",
          "attachment": {
            "type": "photo",
            "value": "https://cdn.wallaps.com/wallpapers/20000/17308.jpg"
          }
        }
      },
    {
        "id": 13,
        "author": {
          "id": 14,
          "avatar": "https://www.dhresource.com/0x0s/f2-albu-g4-M01-6A-A0-rBVaEVd22X6ACqVoAADGBvQANS8795.jpg/robe-10size.jpg",
          "first_name": "Harry",
          "last_name": "Potter",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Thirteenth post: When Jamestown was established in 1607, Smith trained the first settlers to farm and work, thus saving the colony from early devastation. He publicly stated He that will not work, shall not eat, equivalent to the 2nd Thessalonians 3:10 in the Bible. Harsh weather, lack of food and water, the surrounding swampy wilderness, and attacks from local Indians almost destroyed the colony. With Smith's leadership, however, Jamestown survived and eventually flourished. Smith was forced to return to England after being injured by an accidental explosion of gunpowder in a canoe.",
          "attachment": {
            "type": "photo",
            "value": "https://img.clipartxtras.com/c75945fa7b8370be2ef8b43264e07a8a_harry-potter-clip-art-free-download-clipart-3-clipartingcom-harry-potter-clipart-free_841-950.jpeg"
          }
        }
      },
    {
        "id": 14,
        "author": {
          "id": 15,
          "avatar": "https://manofactionfigures.com/sites/default/files/imagecache/product_full/sites/default/files/lord_voldemort.jpg",
          "first_name": "Lord",
          "last_name": "Voldemort",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Fourteenth post: Voldemort is the archenemy of Harry Potter, who according to a prophecy has the power to vanquish the Dark Lord. Nearly every witch or wizard dares not utter his unmentionable name, and refers to him instead with such expressions as You-Know-Who, He-Who-Must-Not-Be-Named or the Dark Lord. Voldemort's obsession with blood purity signifies his aim to rid the wizarding world of Muggle (non-magical) heritage and to conquer both worlds, Muggle and wizarding, to achieve pure-blood dominance. Through his mother's family, he is the last descendant of wizard Salazar Slytherin, one of the four founders of Hogwarts School of Witchcraft and Wizardry. He is the leader of the Death Eaters, a group of evil wizards and witches dedicated to ridding the Wizarding World of Muggles and establishing Voldemort as its supreme ruler.",
          "attachment": {
            "type": "photo",
            "value": "https://data.whicdn.com/images/159280539/large.jpg"
          }
        }
      },
    {
        "id": 15,
        "author": {
          "id": 14,
          "avatar": "https://www.dhresource.com/0x0s/f2-albu-g4-M01-6A-A0-rBVaEVd22X6ACqVoAADGBvQANS8795.jpg/robe-10size.jpg",
          "first_name": "Harry",
          "last_name": "Potter",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Fifteenth: According to Rowling, the idea for both the Harry Potter books and its eponymous character came while waiting for a delayed train from Manchester, England to London in 1990. She stated that the idea of this scrawny, black-haired, bespectacled boy who didn't know he was a wizard became more and more real to me. While developing the ideas for her book, she also decided to make Harry an orphan who attended a boarding school called Hogwarts. She explained in a 1999 interview with The Guardian: Harry had to be an orphan—so that he's a free agent, with no fear of letting down his parents, disappointing them ... Hogwarts has to be a boarding school—half the important stuff happens at night! Then there's the security. Having a child of my own reinforces my belief that children above all want security, and that's what Hogwarts offers Harry.",
          "attachment": {
            "type": "photo",
            "value": "https://manofactionfigures.com/sites/default/files/imagecache/product_full/sites/default/files/lord_voldemort.jpg"
          }
        }
      }
    ]
    }
    """
}

