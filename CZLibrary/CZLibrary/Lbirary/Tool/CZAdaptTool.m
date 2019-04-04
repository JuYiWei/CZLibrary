//
//  CZAdaptTool.m
//  Library
//
//  Created by juyiwei on 2018/7/2.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZAdaptTool.h"

@interface CZAdaptTool()
@property (nonatomic, strong) UIView *adaptView;
@property (nonatomic, strong) UITraitCollection *currentTrait;

@property (nonatomic, strong) UITraitCollection *phoneTrait;
@property (nonatomic, strong) UITraitCollection *padTrait;

@property (nonatomic, strong) UITraitCollection *wcTrait;
@property (nonatomic, strong) UITraitCollection *wrTrait;
@property (nonatomic, strong) UITraitCollection *hcTrait;
@property (nonatomic, strong) UITraitCollection *hrTrait;
@end

@implementation CZAdaptTool

CZ_SINGLETON_IMPLEMENTATION(CZAdaptTool)

- (CZAdaptDeviceType)cz_deviceTypeWithView:(UIView *)view; {
    self.currentTrait = view.traitCollection;
    if ([self.currentTrait containsTraitsInCollection:self.phoneTrait]) {
        return CZAdaptTypePhone;
        
    } else if ([self.currentTrait containsTraitsInCollection:self.padTrait]) {
        return CZAdaptTypePad;
        
    } else {
        return CZAdaptTypeUndefine;
    }
}

- (CZAdaptSizeClassType)cz_sizeClassTypeWithView:(UIView *)view {
    self.currentTrait = view.traitCollection;
    if ([self.currentTrait containsTraitsInCollection:self.wcTrait]) {
        if ([self.currentTrait containsTraitsInCollection:self.hrTrait]) {
            return CZAdaptSizeClassCR;
            
        } else if ([self.currentTrait containsTraitsInCollection:self.hcTrait]) {
            return CZAdaptSizeClassCC;
            
        } else {
            return CZAdaptSizeClassUndefine;
        }
        
    } else if ([self.currentTrait containsTraitsInCollection:self.wrTrait]) {
        if ([self.currentTrait containsTraitsInCollection:self.hrTrait]) {
            return CZAdaptSizeClassRR;
            
        } else if ([self.currentTrait containsTraitsInCollection:self.hcTrait]) {
            return CZAdaptSizeClassRC;
            
        } else {
            return CZAdaptSizeClassUndefine;
        }
        
    } else {
        return CZAdaptSizeClassUndefine;
    }
}

#pragma mark - getter

- (UITraitCollection *)phoneTrait {
    if (!_phoneTrait) {
        _phoneTrait = [UITraitCollection traitCollectionWithUserInterfaceIdiom:UIUserInterfaceIdiomPhone];
    }
    return _phoneTrait;
}

- (UITraitCollection *)padTrait {
    if (!_padTrait) {
        _padTrait = [UITraitCollection traitCollectionWithUserInterfaceIdiom:UIUserInterfaceIdiomPad];
    }
    return _padTrait;
}

- (UITraitCollection *)wcTrait {
    if (!_wcTrait) {
        _wcTrait = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassCompact];
    }
    return _wcTrait;
}

- (UITraitCollection *)wrTrait {
    if (!_wrTrait) {
        _wrTrait = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
    }
    return _wrTrait;
}

- (UITraitCollection *)hcTrait {
    if (!_hcTrait) {
        _hcTrait = [UITraitCollection traitCollectionWithVerticalSizeClass:UIUserInterfaceSizeClassCompact];
    }
    return _hcTrait;
}

- (UITraitCollection *)hrTrait {
    if (!_hrTrait) {
        _hrTrait = [UITraitCollection traitCollectionWithVerticalSizeClass:UIUserInterfaceSizeClassRegular];
    }
    return _hrTrait;
}

@end
