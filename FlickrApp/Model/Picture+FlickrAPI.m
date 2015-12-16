//
//  Picture+FlickrAPI.m
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//

#import "Picture+FlickrAPI.h"
#import "NSManagedObject+CoreData.h"

static NSString *const kApiKey = @"f9e32b90d9f72e76a7343e75f28fca3a";
static NSString *const kSecret = @"8e44c9786669bb32";
static NSString *const kImageURLTemplate = @"https://farm%@.staticflickr.com/%@/%@_%@.jpg";

@implementation Picture (FlickrAPI)

- (NSURL *)imageURL {
    return [NSURL URLWithString:[NSString stringWithFormat:kImageURLTemplate, self.farm, self.serverID, self.pictureID, self.secret]];
}

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context{

    NSString *name = [dictionary valueForKey:@"name"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    Picture *picture = [Picture findFirstWithPredicate:predicate inContext:context];
    if (!picture) {
        picture = [Picture createEntityInContext:context];
        picture.farm     = [dictionary valueForKey:@"farm"];
        picture.serverID  = [dictionary valueForKey:@"serverID"];
        picture.pictureID= [dictionary valueForKey:@"pictureID"];
        picture.secret= [dictionary valueForKey:@"secret"];

    }
    return picture;
}

@end
