//
//  Picture+CoreDataProperties.h
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Picture.h"

NS_ASSUME_NONNULL_BEGIN

@interface Picture (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *pictureID;
@property (nullable, nonatomic, retain) NSNumber *farm;
@property (nullable, nonatomic, retain) NSString *secret;
@property (nullable, nonatomic, retain) NSNumber *serverID;
@property (nullable, nonatomic, retain) User *author;

@end

NS_ASSUME_NONNULL_END
