import React, {useState, useEffect} from 'react';
import {
  View,
  Text,
  Image,
  Modal,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import style from './style';
import api from 'services';

const ServiceAgreement = props => {
  const {handleClose, isShow, handleCancel, sourceFrom, title} = props;
  const [agreementList, setAgreementList] = useState('');

  useEffect(() => {
    // api
    //   .getAgreementList({
    //     pageNo: 1,
    //     pageSize: 5,
    //     status: 1000,
    //     sourceFrom,
    //   })
    //   .then(res => {
    //     setAgreementList(res.records);
    //   });
    setAgreementList('注册须知');
  }, [sourceFrom]);

  return (
    <Modal
      animationType="none"
      visible={isShow}
      onRequestClose={handleClose}
      transparent={true}>
      <View style={style.modalContainer}>
        <View style={style.aggreementWrap}>
          <View style={style.aggreementContent}>
            <Text style={style.headerTit}>{title}</Text>
            <View style={style.content}>
              <ScrollView contentContainerStyle={style.contentContainer}>
                <Text style={style.aggreeText}>
                  【审慎阅读】您在申请注册流程中点击同意前，应当认真阅读以下协议。请您务必审慎阅读、充分理解协议中相关条款内容，其中包括：
                </Text>
                <Text style={style.aggreeText}>
                  1、与您约定免除或限制责任的条款；
                </Text>
                {/* <Text style={style.aggreeText}>
                  2、与您约定法律适用和管辖的条款；
                </Text>
                <Text style={style.aggreeText}>
                  3、其他以粗体下划线标识的重要条款。
                </Text>
                <Text style={style.aggreeText}>
                  如您对协议有任何疑问，可向平台客服咨询。
                </Text>
                <Text style={style.aggreeText}>
                  【特别提示】当您按照注册页面提示填写信息、阅读并同意协议且完成全部注册程序后，即表示您已充分阅读、理解并
                  接受协议的全部内容。如您因平台服务与ESHOP发生争议的，适用《ESHOP平台服务协议》处理。如您在使用平台服务过程中与其他用户发生争议的，依您与其他用户达成的协议处理。
                </Text> */}
                <Text style={style.aggreeText}>
                  阅读协议的过程中，如果您不同意相关协议或其中任何条款约定，您应立即停止注册程序。
                </Text>
              </ScrollView>
            </View>
          </View>
          <View style={style.aggreeBtn}>
            <TouchableOpacity
              style={[style.btn, style.border]}
              onPress={handleCancel}>
              <Text style={style.cancel}>取消</Text>
            </TouchableOpacity>
            <TouchableOpacity style={style.btn} onPress={handleClose}>
              <Text style={style.ok}>同意</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};
export default ServiceAgreement;
