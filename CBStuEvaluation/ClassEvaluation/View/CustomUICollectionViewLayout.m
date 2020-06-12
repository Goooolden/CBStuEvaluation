//
//  CustomUICollectionViewLayout.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/31.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CustomUICollectionViewLayout.h"

@interface CustomUICollectionViewLayout()

@property (strong, nonatomic) NSMutableArray *itemAttributes;
@property (strong, nonatomic) NSMutableArray *itemsSize;
@property (nonatomic, assign) CGSize contentSize;

@property (nonatomic, assign) NSInteger numberOfRows;


@end

@implementation CustomUICollectionViewLayout

- (instancetype)initWithNumberOfRows:(NSInteger)numberOfRows {
    self = [super init];
    if (self) {
        self.numberOfRows = numberOfRows;
    }
    return self;
}

- (void)prepareLayout {
    if ([self.collectionView numberOfSections] == 0) {
        return;
    }
    
    if (self.itemAttributes.count != [self.collectionView numberOfSections]) {
        [self generateItemAttributes:self.collectionView];
        return;
    }
    
    //    if (self.itemAttributes.count > 0) { // We don't enter in this if statement the first time, we enter the following times
    //        for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
    //            NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
    //            for (NSUInteger index = 0; index < numberOfItems; index++) {
    //                if (section != 0 && index != 0) { // This is a content cell that shouldn't be sticked
    //                    continue;
    //                }
    //                UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
    //                if (section == 0) { // We stick the first row
    //                    CGRect frame = attributes.frame;
    //                    frame.origin.y = self.collectionView.contentOffset.y;
    //                    attributes.frame = frame;
    //
    //                }
    //                if (index == 0) { // We stick the first column
    //                    CGRect frame = attributes.frame;
    //                    frame.origin.x = self.collectionView.contentOffset.x;
    //                    attributes.frame = frame;
    //                }
    //            }
    //        }
    //
    ////        return;
    //    }
}

- (void)generateItemAttributes:(UICollectionView *)collectionView {
    
    // The following code is only executed the first time we prepare the layout
    self.itemAttributes = [@[] mutableCopy];
    self.itemsSize = [@[] mutableCopy];
    
    // Tip: If we don't know the number of columns we can call the following method and use the NSUInteger object instead of the NUMBEROFCOLUMNS macro
    // NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
    
    // We calculate the item size of each column
    if (self.itemsSize.count != self.numberOfRows) {
        [self calculateItemsSize];
    }
    
    NSUInteger column = 0; // Current column inside row
    CGFloat xOffset = 0.0;
    CGFloat yOffset = 0.0;
    CGFloat contentWidth = 0.0; // To determine the contentSize
    CGFloat contentHeight = 0.0; // To determine the contentSize
    
    // We loop through all items
    for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
        NSMutableArray *sectionAttributes = [@[] mutableCopy];
        for (NSUInteger index = 0; index < self.numberOfRows; index++) {
            CGSize itemSize = [self.itemsSize[index] CGSizeValue];
            
            // We create the UICollectionViewLayoutAttributes object for each item and add it to our array.
            // We will use this later in layoutAttributesForItemAtIndexPath:
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));
            
            //            if (section == 0 && index == 0) {
            //                attributes.zIndex = 1024; // Set this value for the first item (Sec0Row0) in order to make it visible over first column and first row
            //            } else if (section == 0 || index == 0) {
            //                attributes.zIndex = 1023; // Set this value for the first row or section in order to set visible over the rest of the items
            //            }
            //            if (section == 0) {
            //                CGRect frame = attributes.frame;
            //                frame.origin.y = self.collectionView.contentOffset.y;
            //                attributes.frame = frame; // Stick to the top
            //            }
            //            if (index == 0) {
            //                CGRect frame = attributes.frame;
            //                frame.origin.x = self.collectionView.contentOffset.x;
            //                attributes.frame = frame; // Stick to the left
            //            }
            
            [sectionAttributes addObject:attributes];
            
            xOffset = xOffset+itemSize.width + 1;
            column++;
            
            // Create a new row if this was the last column
            if (column == self.numberOfRows) {
                if (xOffset > contentWidth) {
                    contentWidth = xOffset;
                }
                
                // Reset values
                column = 0;
                xOffset = 0;
                yOffset += itemSize.height + 1;
            }
        }
        [self.itemAttributes addObject:sectionAttributes];
    }
    
    // Get the last item to calculate the total height of the content
    UICollectionViewLayoutAttributes *attributes = [[self.itemAttributes lastObject] lastObject];
    contentHeight = attributes.frame.origin.y+attributes.frame.size.height;
    self.contentSize = CGSizeMake(contentWidth, contentHeight);
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.itemAttributes[indexPath.section][indexPath.row];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [@[] mutableCopy];
    for (NSArray *section in self.itemAttributes) {
        [attributes addObjectsFromArray:[section filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
            return CGRectIntersectsRect(rect, [evaluatedObject frame]);
        }]]];
    }
    
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES; // Set this to YES to call prepareLayout on every scroll
}

//- (CGSize)sizeForItemWithColumnIndex:(NSUInteger)columnIndex {
//    NSString *text;
//    switch (columnIndex) { // This only makes sense if the size of the items should be different
//        case 0:
//            text = @"MMM-99";
//
//        default:
//            text = @"Content";
//    }
//    CGSize size = [text sizeWithAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
//    return CGSizeMake([@(size.width + 16) floatValue], 30); // Extra space of 9px for all the items
//}

- (void)calculateItemsSize {
    NSInteger itemWidth = (SCREEN_WIDTH-3)/4;
    NSInteger itemHeight = itemWidth * 84 / 93;
    for (NSUInteger index = 0; index < self.numberOfRows; index++) {
        if (self.itemsSize.count <= index) {
//            CGSize itemSize = [self sizeForItemWithColumnIndex:index];
            CGSize itemSize = CGSizeMake(itemWidth, itemHeight);
            NSValue *itemSizeValue = [NSValue valueWithCGSize:itemSize];
            [self.itemsSize addObject:itemSizeValue];
        }
    }
}

@end