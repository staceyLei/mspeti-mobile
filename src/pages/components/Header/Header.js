import React, {Component} from 'react';
import {View, Text, Image, TouchableOpacity} from 'react-native';
import styles from './style';

export default class Header extends Component {
  render() {
    const NavigationBar = [];
    const content = icon => (
      <View style={styles.content}>
        <Image source={icon.image} style={icon.style} />
        {icon.text ? <Text style={styles.text}>{icon.text}</Text> : null}
      </View>
    );

    // 左边图片按钮
    if (this.props.leftIcon) {
      NavigationBar.push(
        <TouchableOpacity
          key={'leftIcon'}
          activeOpacity={0.75}
          style={styles.icon}
          onPress={this.props.leftIconAction}>
          {content(this.props.leftIcon)}
        </TouchableOpacity>,
      );
    }
    // 标题
    if (this.props.title) {
      const {titleProps} = this.props;
      if (this.props.subTitle) {
        NavigationBar.push(
          <View style={{alignItems: 'center'}}>
            <Text key={'title'} style={styles.title}>
              {this.props.title}
            </Text>
            <Text key={'subTitle'} style={styles.subTitle}>
              {this.props.subTitle}
            </Text>
          </View>,
        );
      } else {
        NavigationBar.push(
          <Text key={'title'} style={[styles.title, titleProps]}>
            {this.props.title}
          </Text>,
        );
      }
    }
    // 自定义标题View
    if (this.props.titleView) {
      const TitleView = this.props.titleView;
      const {titleViewProps, titleViewType} = this.props;
      NavigationBar.push(
        <View style={{flex: 1}} key={'titleView'}>
          <TitleView {...titleViewProps} />
        </View>,
      );
    }
    // 右边图片按钮
    if (this.props.rightIcon) {
      NavigationBar.push(
        <TouchableOpacity
          key={'rightIcon'}
          activeOpacity={0.75}
          style={styles.icon}
          onPress={this.props.rightIconAction}>
          {content(this.props.rightIcon)}
        </TouchableOpacity>,
      );
    }
    if (this.props.rightIcon2) {
      NavigationBar.push(
        <TouchableOpacity
          key={'rightIcon2'}
          activeOpacity={0.75}
          style={styles.icon}
          onPress={this.props.rightIcon2Action}>
          {content(this.props.rightIcon2)}
        </TouchableOpacity>,
      );
    }
    if (this.props.rightIcon3) {
      NavigationBar.push(
        <TouchableOpacity
          key={'rightIcon3'}
          activeOpacity={0.75}
          style={styles.rightIcon3}
          onPress={this.props.rightIcon3Action}>
          {content(this.props.rightIcon3)}
        </TouchableOpacity>,
      );
    }
    // 右边文字按钮
    if (this.props.rightButton) {
      const {text, style} = this.props.rightButton;
      NavigationBar.push(
        <TouchableOpacity
          key={'rightButton'}
          activeOpacity={0.75}
          style={styles.rightButton}
          onPress={this.props.rightButtonAction}>
          <View style={styles.content}>
            <Text style={[styles.buttonTitleFont, style]}>{text}</Text>
          </View>
        </TouchableOpacity>,
      );
    }

    return (
      <View
        ref={refs => this.props.onRef && this.props.onRef(refs)}
        style={[
          styles.navigationBarContainer,
          this.props.backgroundColor,
          this.props.styles,
        ]}>
        {NavigationBar}
      </View>
    );
  }
}
