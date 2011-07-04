//
//  MCUsers.m
//  Serwus
//
//  Created by Madis Nõmme on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MCUsers.h"
#import "MCUser.h"
#import "SBJson.h"

@implementation MCUsers

@synthesize users=_users;

- (NSString *)jsonRepresentation
{	NSArray *userFields = [NSArray arrayWithObjects:@"fullName", @"username", @"picture", @"status", nil];
	NSMutableArray *usersAsDictionaries = [NSMutableArray arrayWithCapacity:0];
	for (MCUser *user in self.users) {
		NSDictionary *userDict = [user dictionaryWithValuesForKeys:userFields];
		[usersAsDictionaries addObject:userDict];
	}
	return [usersAsDictionaries JSONRepresentation];
}

- (NSData *)doPostWithInfo:(NSDictionary *)info
{
	[NSException raise:@"Not implemented yet" format:@"", nil];
	return nil;
}

- (NSData *)doGetWithInfo:(NSDictionary *)info
{
	NSData *data = [[self jsonRepresentation] dataUsingEncoding:NSUTF8StringEncoding];
	return data;
}

- (NSData *)doPutWithInfo:(NSDictionary *)info
{
	[NSException raise:@"Not implemented yet" format:@"", nil];
	return nil;
}

- (NSData *)doDeleteWithInfo:(NSDictionary *)info
{
	[NSException raise:@"Not implemented yet" format:@"", nil];
	return nil;
}

- (id)initWithUsers:(NSArray *)users
{
	self=[super init];
	if (self != nil) {
		self.users = [NSMutableArray arrayWithCapacity:0];
		if (users != nil || [users count] > 0) {
			[self.users addObjectsFromArray:users];
		}
	}
	return self;
}

- (id)init
{
	return [self initWithUsers:nil];
}

- (void)addUser:(MCUser *)user
{
	if ([user isKindOfClass:[MCUser class]]) {
		[self.users addObject:user];
	}
	
}
- (void)addUsers:(NSArray *)users
{
	[self.users addObjectsFromArray:users];
}

- (void)dealloc
{
	[_users release];
	[super dealloc];
}

@end
