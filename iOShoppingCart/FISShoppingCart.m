//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Betty Fung on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{
    
    self.items = [[NSMutableArray alloc] init]; //this needs to be initialized here... tried doing it in addItem method but got errors of unrecognized selector sent to instance blahblahblah. need to ask why! :)
    
    NSUInteger totalPriceInCents = 0;
    
    for(NSNumber *priceOfItem in self.items){
        totalPriceInCents += [priceOfItem integerValue];
    }
    
    return totalPriceInCents;
}



-(void)addItem:(FISItem *)item{
    
    [self.items addObject:item];
    
    //returns nothing
}



-(void)removeItem:(FISItem *)item{

    NSUInteger itemIndex = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemIndex];
    
    //returns nothing
}



-(void)removeAllItemsLikeItem:(FISItem *)item{
    
    do{
        [self removeItem:item];
    } while([self.items containsObject:item]);
    
    //returns nothing
}


-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
   
    self.items = [self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor];
    
    //returns nothing
}



-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor];
    
    //returns nothing
}



-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor];
    
    //returns nothing;
}



-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:NO];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor];
    
    //returns nothing;
}



-(NSArray *)allItemsWithName:(NSString *)name{
    
    NSMutableArray *cartItemsWithName = [[NSMutableArray alloc] init];
    
    for(NSString *item in self.items){
        if([item isEqualToString:name]){
            [cartItemsWithName addObject:item];
        }
    }
    
    return cartItemsWithName;
}



-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    
//    NSPredicate *getCartItemsWithName = [NSPredicate predicateWithFormat:price];
//    NSArray *cartItemsWithName = [self.items filteredArrayUsingPredicate:getCartItemsWithName];
    
    return @[];
}



-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    return @[]; 
}

@end
