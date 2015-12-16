//
//  FlickrAPI.h
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrAPIResponse : NSObject

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary keyForResults:(NSString *)key;

@property (nonatomic) BOOL success;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic) NSUInteger code;
@property (nonatomic, strong) NSString *message;

@end

@interface FlickrAPI : NSObject

+ (instancetype)sharedService;
- (void)getRecent:(void (^)(FlickrAPIResponse *response))completion;

@end
