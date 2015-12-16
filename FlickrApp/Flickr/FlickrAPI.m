//
//  FlickrAPI.m
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//

#import "FlickrAPI.h"
#import "Picture+FlickrAPI.h"
#import "NSManagedObjectContext+MainContext.h"


static NSString *const kApiKey = @"f9e32b90d9f72e76a7343e75f28fca3a";
static NSString *const kBaseURL = @"https://api.flickr.com/services/rest";

@implementation FlickrAPIResponse

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary keyForResults:(NSString *)key {
    self = [super init];
    if (self) {
        self.success = [jsonDictionary[@"stat"] isEqualToString:@"ok"] ? YES : NO;
        self.message = jsonDictionary[@"message"];
        self.code = [jsonDictionary[@"code"] integerValue];
        self.results = [jsonDictionary valueForKeyPath:key];
    }
    return self;
}

@end

@implementation FlickrAPI

+ (instancetype)sharedService {
    static id instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)getRecent:(void (^)(FlickrAPIResponse *response))completion
{
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=f9e32b90d9f72e76a7343e75f28fca3a&extras=owner_name&format=json"];
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:url];
            NSError *error;
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            FlickrAPIResponse *response;
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                response = [[FlickrAPIResponse alloc] initWithJSON:result keyForResults:@"photos.photo"];
                
                for (NSDictionary *object in response.results) {
                    NSManagedObjectContext *context;
                    [Picture objectWithDictionary:object inContext:context];
                }
                
                NSManagedObjectContext *context = [NSManagedObjectContext backgroundContext];
                
                if ([result isKindOfClass:[NSArray class]]){
                    NSArray *parsedResults = result;
                    
                    for (NSDictionary *dictionary in parsedResults)
                        [Picture objectWithDictionary:dictionary inContext:context];
                }
                [context performBlockAndWait:^{
                    [context save:NULL];
                    [context.parentContext performBlock:^{
                        [context.parentContext save:NULL];
                        
                    }];
                }];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion (response);
            });
        });
            
    
}
@end
