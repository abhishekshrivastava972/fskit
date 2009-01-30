/*
 *  FSKit.h
 *  FSKit
 *
 *  Created by Logan Allred on 1/13/08.
 *  Copyright 2008 Logan Allred. All rights reserved.
 *
 */

#if TARGET_OS_IPHONE
#import "TouchXML.h"
#define NSXMLDocument CXMLDocument 
#define NSXMLElement CXMLElement 
#define NSXMLNode CXMLNode
#endif

#import "FSKConnection.h"
#import "FSKRequest.h"
#import "FSKResponse.h"
#import "FSKError.h"

// services
#import "FSKPersonService.h"
#import "FSKAuthoritiesService.h"
#import "FSKTempleService.h"
#import "FSKIdentityService.h"
#import "FSKFamilyService.h"

// requests
#import "FSKIdentityRequest.h"
#import "FSKPersonReadRequest.h"
#import "FSKPersonSearchRequest.h"
#import "FSKUserReadRequest.h"

// responses
#import "FSKIdentityResponse.h"
#import "FSKPersonResponse.h"
#import "FSKSearchResponse.h"
#import "FSKUserResponse.h"

// model
#import "FSKUser.h"
#import "FSKPerson.h"
#import "FSKFamily.h"
#import "FSKCouple.h"
#import "FSKPersonSummary.h"
#import "FSKEventSummary.h"
#import "FSKSearchResult.h"
#import "FSKDate.h"
#import "FSKPlace.h"

// repositories
#import "FSKPersonRepository.h"
#import "FSKUserRepository.h"