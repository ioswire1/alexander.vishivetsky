//
//  Picture+FlickrAPI.h
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//

#import "Picture.h"

@interface Picture (FlickrAPI)

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context;
- (NSURL *)imageURL;

@end
