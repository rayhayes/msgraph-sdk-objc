//
//  MSClientFactoryTests.m
// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
//

#import <XCTest/XCTest.h>
#import "MSGraphCoreSDKTests.h"

@interface MSClientFactoryTests : MSGraphCoreSDKTests

@end

@implementation MSClientFactoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreationOfHTTPClient{
    XCTAssertThrows([MSClientFactory createHTTPClientWithAuthenticationProvider:nil]);
    XCTAssertThrows([MSClientFactory createHTTPClientWithMiddleware:nil]);

    MSHTTPClient *defaulClient = [MSClientFactory createHTTPClientWithAuthenticationProvider:self.mockAuthProvider];
    XCTAssertNotNil(defaulClient);

    MSHTTPClient *customClient = [MSClientFactory createHTTPClientWithMiddleware:OCMProtocolMock(@protocol(MSGraphMiddleware))];
    XCTAssertNotNil(customClient);
}
@end