//
//  GithubRepoFetcher.m
//  GithubRepo
//
//  Created by Markus Chow on 17.07.20.
//  Copyright © 2020 Markus Chow. All rights reserved.
//

#import "GithubRepoFetcher.h"

#import "GithubRepoConstants.h"
//#import <AFNetworking/AFNetworking.h>

NSString * _Nonnull const NetworkErrorDomain = @"NetworkErrorDomain";

@implementation GithubRepoFetcher

+ (void)fetchRepo:(NSString *_Nonnull)name onSuccess:(OnSuccess)onSuccess onError:(OnError)onError {
	/// do input check for valid repo name format
	if ([GithubRepoFetcher inputCheck:name] == NO) {
		NSError *error = [NSError errorWithDomain:NetworkErrorDomain code:IncorrectRepoName userInfo:nil];
		onError(error);
		return;
	}
	
	NSString *urlString = [NSString stringWithFormat:GITHUB_REPO_API, name];
	NSURL *url = [NSURL URLWithString:urlString];

	[self performNetworkCall:url onSuccess:onSuccess onError:onError];
		
}

+ (BOOL)inputCheck:(NSString *)string {
	
	string = [string lowercaseString];
	
	NSString *pattern = @"^[a-z\\d](?:[a-z\\d]|-(?=[a-z\\d])){0,38}$";

	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
	BOOL match = [predicate evaluateWithObject:string];
	return match;
	
}

+ (void)performNetworkCall:(NSURL *)url onSuccess:(OnSuccess)onSuccess onError:(OnError)onError {
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	
	
//	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//	AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//	NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
//		NSLog(@"uploadProgress : %@", uploadProgress);
//	} downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
//		NSLog(@"uploadProgress : %@", downloadProgress);
//	} completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//		if (error) {
//			NSLog(@"Error: %@", error);
//			onError(error);
//		} else {
//			NSLog(@"%@ %@", response, responseObject);
//			onSuccess(responseObject);
//		}
//	}];
//	[dataTask resume];
}

@end

