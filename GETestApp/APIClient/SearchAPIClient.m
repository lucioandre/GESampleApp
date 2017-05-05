//
//  SearchAPIClient.m
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchAPIClient.h"
#import "AFNetworking.h"

@interface SearchAPIClient ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;
@end

@implementation SearchAPIClient

- (id)init {
    self = [super init];
    if (self) {
        //TODO: Store baseUrl at PList file
        NSURL *baseUrl = [NSURL URLWithString:@"https://api.myjson.com/bins/"];
        self.operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
        self.operationManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

#pragma APIClientProtocol

- (void)fetchBusesWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion {
    //TODO: Store endpoint at PList file
    NSString *endPoint = @"37yzm";
    [self fetchTransportationForEndPoint:endPoint onComplete:completion];
}

- (void)fetchTrainsWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion {
    NSString *endPoint = @"3zmcy";
    [self fetchTransportationForEndPoint:endPoint onComplete:completion];
}

- (void)fetchFlightsWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion {
    NSString *endPoint = @"w60i";
    [self fetchTransportationForEndPoint:endPoint onComplete:completion];
}

#pragma mark - Private Method

- (void)fetchTransportationForEndPoint:(NSString *)endPoint onComplete:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion {
    if (!completion) {
        return;
    }
    
    [self.operationManager GET:endPoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (operation.response.statusCode == 200) {
            NSArray* response = [MTLJSONAdapter modelsOfClass:TransportationOption.class fromJSONArray:responseObject error:nil];
            if (completion) {
                completion(response, nil);
            }
        } else {
            completion(nil, operation.error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

@end
