//
//  PickerAlertView.m
//  YunPlus
//
//  Created by juxue.chen on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DatePickerAlertView.h"

@implementation DatePickerAlertView

@synthesize DatePicker=_datePickerView;

#pragma mark - UIPickerView - Date/Time

- (id)createContentView
{
	_datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectZero];
	_datePickerView.datePickerMode = UIDatePickerModeDate;  
    _datePickerView.opaque = TRUE;
    
	[self addSubview:self.DatePicker];
    
    return _datePickerView;
}

@end
