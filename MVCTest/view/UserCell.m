//
//  UserCell.m
//  MVCTest
//
//  Created by WangTu on 15/8/19.
//  Copyright (c) 2015年 WangTu. All rights reserved.
//

#import "UserCell.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation UserCell {
    UILabel *_nameLabel;
    UILabel *_ageLabel;
    UILabel *_genderLabel;
    UILabel *_phoneLabel;
}

- (void)awakeFromNib {}

- (UserCell *)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/4, 40)];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
        
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/4, 0, kScreenWidth/4, 40)];
        _ageLabel.textColor = [UIColor blackColor];
        _ageLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_ageLabel];
        
        _genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/4*2, 0, kScreenWidth/4/2, 40)];
        _genderLabel.textColor = [UIColor blackColor];
        _genderLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_genderLabel];
        
        _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/4*3-kScreenWidth/4/2, 0, kScreenWidth/4+kScreenWidth/4/2, 40)];
        _phoneLabel.textColor = [UIColor blackColor];
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_phoneLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(UserModel *)model {
    _model = model;
    _nameLabel.text = model.name;
    _ageLabel.text = model.age;
    _genderLabel.text = model.gender;
    _phoneLabel.text = model.phone;
}

@end
