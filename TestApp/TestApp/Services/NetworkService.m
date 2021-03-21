//
//  NetworkService.m
//  TestApp
//
//  Created by Andrey on 12/03/2021.
//

#import "NetworkService.h"
#import "QTWelcome.h"

#define MAIN_URL @"http://newsapi.org/v2/everything?q=tesla&from=2021-03-12&sortBy=publishedAt&apiKey=e25c85638cec444eadd056bce705301f"

@implementation NetworkService

+ (instancetype)sharedInstance {
    static NetworkService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkService alloc] init];
    });
    return instance;
}

- (void)getNews:(void (^)(NSArray *news))completion {
    [self load:MAIN_URL withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
      if (response) {
        NSArray *articles = [response valueForKey:@"articles"];
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *article in articles) {
            QTArticle *model = [[QTArticle alloc] initFromDictionary:article];
            [array addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(array);
        });
    }
    
}];
}

- (void)load:(NSString*)address withCompletion:(void (^)(id _Nullable result))completion {
    [[[NSURLSession sharedSession ] dataTaskWithURL:[NSURL URLWithString:address]
                                  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil]);
    }] resume];
}

@end

