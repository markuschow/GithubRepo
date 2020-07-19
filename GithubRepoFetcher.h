//
//  GithubRepoFetcher.h
//  GithubRepo
//
//  Created by Markus Chow on 17.07.20.
//  Copyright © 2020 Markus Chow. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^OnSuccess)(id _Nullable response);
typedef void (^OnError)(NSError *_Nullable error);

typedef enum : NSUInteger {
	IncorrectRepoName = -1,
} MyEnumNetworkErrorCode;

NS_ASSUME_NONNULL_BEGIN

@interface GithubRepoFetcher : NSObject <NSURLSessionDelegate> 

+ (void)fetchRepo:(NSString *_Nonnull)name onSuccess:(OnSuccess)onSuccess onError:(OnError)onError;

@end

NS_ASSUME_NONNULL_END
