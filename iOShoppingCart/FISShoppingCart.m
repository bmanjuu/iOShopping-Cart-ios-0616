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
    
     // self.items = [[NSMutableArray alloc] init]; // self.items does not need to be initialized
    
    NSUInteger totalPriceInCents = 0;
    
    
    // create a new FISItem so you can access the property when you go through the loop
    for(FISItem *priceOfItem in self.items){
        totalPriceInCents += priceOfItem.priceInCents;
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
   
    self.items = [[self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor] mutableCopy];
    
    //returns nothing
}



-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [[self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor] mutableCopy];
    
    //returns nothing
}



-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [[self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor] mutableCopy];
    
    //returns nothing;
}



-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortShoppingItemsByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:NO];
    
    NSArray *sortShoppingCartDescriptor = [NSArray arrayWithObject:sortShoppingItemsByNameAsc];
    
    self.items = [[self.items sortedArrayUsingDescriptors:sortShoppingCartDescriptor] mutableCopy];
    
    //returns nothing;
}



-(NSArray *)allItemsWithName:(NSString *)name{
    
    NSMutableArray *cartItemsWithName = [[NSMutableArray alloc] init];
    
    for(FISItem *cartItems in self.items){
        if([cartItems.name isEqualToString: name]){
            [cartItemsWithName addObject:cartItems];
            //need cartItems, not cartItems.name, need to look into this for further clarification  
        }
    }
    
    return cartItemsWithName;
}



-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    
    NSPredicate *itemsWithLowestPrice = [NSPredicate predicateWithFormat:@"self.priceInCents >= %lu", price];
    NSArray *cartItemsWithLowestPrice = [self.items filteredArrayUsingPredicate:itemsWithLowestPrice];
    
    return cartItemsWithLowestPrice;
}



-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    
    NSPredicate *itemsWithHighestPrice = [NSPredicate predicateWithFormat:@"self.priceInCents <= %lu", price];
    NSArray *cartItemsWithHighestPrice = [self.items filteredArrayUsingPredicate:itemsWithHighestPrice];
    
    return cartItemsWithHighestPrice;
}

@end
