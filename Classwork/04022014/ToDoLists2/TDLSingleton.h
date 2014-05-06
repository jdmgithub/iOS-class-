//
//  TDLSingleton.h
//  ToDoLists
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLSingleton : NSObject

+ (TDLSingleton *)sharedCollection;

- (void)addListItem: (NSDictionary *)listItem;
- (void)removeListItems:(NSDictionary *)listItem;
- (void)removeListItemsAtIndex:(NSInteger)index;
- (NSArray *)allListItems;

@end
