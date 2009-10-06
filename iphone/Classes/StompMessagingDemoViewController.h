//
//  StompMessagingDemoViewController.h
//  StompMessagingDemo
//
//  Created by Stefan Saasen on 10.09.09.
//  Copyright coravy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRVStompClient;
@protocol CRVStompClientDelegate;


@interface StompMessagingDemoViewController : UIViewController<CRVStompClientDelegate,UITextFieldDelegate> {
	@private
	CRVStompClient *service;
	UITextView *messages;
	UITextField *inputField;
	UITextField *addressField;	
	UIImageView *statusImage;
	UIButton *refreshConnectionBtn;
	UILabel *versionLabel;

	UIButton *sendBtn;
	UIButton *sendDefaultBtn;
}

@property(nonatomic, retain) CRVStompClient *service;
@property(nonatomic, retain) IBOutlet UITextView *messages;
@property(nonatomic, retain) IBOutlet UITextField *inputField;
@property(nonatomic, retain) IBOutlet UITextField *addressField;
@property(nonatomic, retain) IBOutlet UIImageView *statusImage;
@property(nonatomic, retain) IBOutlet UIButton *refreshConnectionBtn;

@property(nonatomic, retain) IBOutlet UIButton *sendBtn;
@property(nonatomic, retain) IBOutlet UIButton *sendDefaultBtn;

@property(nonatomic, retain) IBOutlet UILabel *versionLabel;

-(IBAction) sendMessage;
-(IBAction) sendDefaultMessage;
-(IBAction) refreshConnection;

@end


