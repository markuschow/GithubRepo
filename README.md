# GithubRepo
Welcome to the GithubRepo! 

This GithubRepo framework is a demo to show the framework implemention of an API call to query a GitHub repo by user entering the repo's name.

This framework writtern in Objective-c and require dependecy of AFNetworking.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- The framework currently supports Xcode 11.6 (Objective-c).
- Use CocoaPod to handle dependecy in Xcode

## Installation

GithubRepo is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GithubRepo'
```

## Usage

### GithubRepoFetcher

`GithubRepoFetcher`  creates and manages an `AFURLSessionManager` object based to perfrom Github repo search API call. Which require to recevie a correct Git user name.

#### Creating a Github Repo API Call

```objective-c
@import GithubRepo;

[GithubRepoFetcher fetchRepo:@"repositoryUserName" onSuccess:^(id  _Nullable response) {
	if (response) {
		NSLog(@"response : %@", response);
	}
} onError:^(NSError * _Nullable error) {
	if (error) {
		NSLog(@"error : %@", error.localizedDescription);
	}
}];
```

## Author

Markus Chow, markuschow@gmail.com

## License

GithubRepo is available under the MIT license. See the LICENSE file for more info.
