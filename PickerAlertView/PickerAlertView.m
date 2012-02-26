//
//  PickerAlertView.m
//  YunPlus
//
//  Created by juxue.chen on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PickerAlertView.h"

@implementation PickerAlertView

@synthesize Picker=_PickerView;


-(void) setDelegate:(id)delegate
{
    [super setDelegate:delegate];
    
    if (delegate != nil) 
    {
        self.Picker.delegate = delegate;
        self.Picker.dataSource =delegate;
        [self.Picker reloadAllComponents];
    }
    else 
    {
        self.Picker.delegate = nil;
        self.Picker.dataSource =nil;
    }
}


#pragma mark - UIPickerView 

- (id)createContentView
{
	_PickerView = [[UIPickerView alloc] initWithFrame:CGRectZero]; 
    _PickerView.opaque = TRUE;
    _PickerView.showsSelectionIndicator=TRUE;
           
	[self addSubview:self.Picker];
    
    return _PickerView;
}

@end
