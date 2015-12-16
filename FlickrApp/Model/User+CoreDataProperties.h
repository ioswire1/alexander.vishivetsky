//
//  User+CoreDataProperties.h
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSManagedObject *picture;

@end

NS_ASSUME_NONNULL_END
