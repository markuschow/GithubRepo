//
//  GITHUBREPOViewController.m
//  GithubRepo
//
//  Created by Markus Chow on 07/18/2020.
//  Copyright (c) 2020 Markus Chow. All rights reserved.
//

#import "GITHUBREPOViewController.h"

#import <GithubRepo/GithubRepoFetcher.h>

@interface GITHUBREPOViewController ()

@end

@implementation GITHUBREPOViewController

@synthesize searchBar, textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self setupViews];
}

- (void)setupViews {
	searchBar = [UISearchBar new];
	searchBar.delegate = self;
	searchBar.showsCancelButton = YES;
	[self.view addSubview:searchBar];
	searchBar.translatesAutoresizingMaskIntoConstraints = NO;
		
	textView = [UITextView new];
	textView.editable = NO;
	[self.view addSubview:textView];
	textView.translatesAutoresizingMaskIntoConstraints = NO;
	
	[NSLayoutConstraint activateConstraints:@[
		[searchBar.centerXAnchor constraintEqualToAnchor:searchBar.superview.centerXAnchor],
		[searchBar.topAnchor constraintEqualToAnchor:searchBar.superview.topAnchor constant:50],
		[searchBar.widthAnchor constraintEqualToAnchor:searchBar.superview.widthAnchor],
		[searchBar.heightAnchor constraintEqualToConstant:50],
		
		[textView.topAnchor constraintEqualToAnchor:searchBar.bottomAnchor constant:10],
		[textView.bottomAnchor constraintEqualToAnchor:textView.superview.bottomAnchor constant:-20],
		[textView.leadingAnchor constraintEqualToAnchor:textView.superview.leadingAnchor constant:10],
		[textView.trailingAnchor constraintEqualToAnchor:textView.superview.trailingAnchor constant:-10],
		
	]];
}

- (void)getGithubRepo:(NSString *)name {
	[GithubRepoFetcher fetchRepo:name onSuccess:^(id  _Nullable response) {
		if (response) {
			NSLog(@"response : %@", response);
			self.textView.text = [NSString stringWithFormat:@"%@", response];
		}
	} onError:^(NSError * _Nullable error) {
		if (error) {
			NSLog(@"error : %@", error.localizedDescription);
			self.textView.text = [NSString stringWithFormat:@"%@", error.localizedDescription];
		}
	}];
}

#pragma mark - UISearchBar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self getGithubRepo:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	[searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
