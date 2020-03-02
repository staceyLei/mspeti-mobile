const studentData = {
  'studentId': '20162020202',
  'studentName': '李明',
  'studentGender': '0',
  'studentAge': '14',
  'studentImg':
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582825374492&di=240133b926b65ffbf18a3e3b46ef25db&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201409%2F10%2F20140910163851_rmZPA.thumb.700_0.jpeg',
  'studentAddress': '广东省广州市',
  'studentCourse': [
    {
      'courseName': '美术趣味课堂',
      'courseHours': '48',
      'courseTeacher': {
        'teacherName': '李老师',
        'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
        'teacherPhone': '17666552555',
        'teacherComment': [
          {
            "commentId": '1',
            "pubImg":
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
            'pubName': 'lili',
            "receiveName": "李老师",
            "courseName": "美术趣味课堂",
            "pubDate": "2020年3月5日",
            'receiveImg':
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
            "star": "3",
            "pubWord": "老师教学认真，讲解清晰！",
          },
          {
            "commentId": '1',
            "pubImg":
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
            'pubName': 'lili',
            "receiveName": "李老师",
            "courseName": "美术趣味课堂",
            "pubDate": "2020年3月5日",
            'receiveImg':
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
            "star": "5",
            "pubWord": "老师教学认真，讲解清晰！",
          },
        ],
        'teacherImg':
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
      },
      'startDate': '2020年02月03日',
      'endDate': '2020年02月14日',
      'courseImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
      'courseTime': [
        {'weekDay': '1', 'startTime': '8:00', 'endTime': '8:45'},
        {'weekDay': '1', 'startTime': '8:50', 'endTime': '9:35'},
        {'weekDay': '2', 'startTime': '9:40', 'endTime': '10:25'},
        {'weekDay': '2', 'startTime': '10:30', 'endTime': '10:15'},
      ],
      'coursePeopleNum': '20',
      'coursePrice': '165',
      'courseId': '1',
      'courseInfo': '名师辅导，一对一教学',
      'discount': '20',
      'nowCourseHours': '36',
    },
    {
      'courseName': '数学趣味课堂',
      'courseHours': '48',
      'courseTeacher': {
        'teacherComment': [
          {
            "commentId": '1',
            "pubImg":
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
            'pubName': 'lili',
            "receiveName": "李老师",
            "courseName": "数学趣味课堂",
            "pubDate": "2020年3月5日",
            'receiveImg':
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
            "star": "3",
            "pubWord": "老师教学认真，讲解清晰！",
          },
        ],
        'teacherName': '李老师',
        'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
        'teacherPhone': '17666552555',
        'teacherImg':
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
      },
      'startDate': '2020年02月03日',
      'endDate': '2020年02月14日',
      'courseImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
      'courseTime': [
        {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
        {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
        {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
        {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
      ],
      'coursePeopleNum': '25',
      'courseId': '4',
      'courseInfo': '名师辅导，一对一教学',
      'discount': '20',
      'coursePrice': '165',
      'nowCourseHours': '44'
    },
  ]
};

List courseData = [
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "5",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
    'courseTime': [
      {'weekDay': '1', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '1', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '2', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '2', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '20',
    'coursePrice': '165',
    'courseId': '1',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '20',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '46',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "4",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514941&di=e9e4873d161571b52bea030f7245d754&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F180408%2F1-1P40Q63534.jpg',
    'courseTime': [
      {'weekDay': '3', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '3', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '5', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '5', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePrice': '165',
    'courseId': '2',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '20',
    'coursePeopleNum': '20',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "5",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "5",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '20',
    'courseId': '3',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '30',
    'coursePrice': '165',
  },
  {
    'courseName': '数学趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '25',
    'courseId': '4',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '20',
    'coursePrice': '165',
  },
  {
    'courseName': '作业辅导班',
    'courseHours': '48',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "2",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '20',
    'courseId': '5',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '40',
    'coursePrice': '165',
  },
  {
    'courseName': '作业辅导班',
    'courseHours': '40',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "2",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1096584731,383044493&fm=26&gp=0.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '25',
    'courseId': '6',
    'courseInfo': '辅导全科作业，提高班',
    'discount': '40',
    'coursePrice': '199',
  },
  {
    'courseName': '作业辅导班',
    'courseHours': '40',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "美术趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "5",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582959814925&di=f83debd12a081560ab162786afe4ef54&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F4938693%2Fposter%2FT_ELN3Z19A%2FT_ELN3Z19A_v8.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '30',
    'courseId': '7',
    'courseInfo': '基础差，不用怕。语数英基础重点剖析，小班教学，找出知识漏洞，稳打稳扎提高成绩。',
    'discount': '40',
    'coursePrice': '199',
  },
];

List shopCartData = [
  {
    'courseName': '作业辅导班',
    'courseHours': '48',
    'courseTeacher': {
      'teacherComment': [
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "3",
          "pubWord": "老师教学认真，讲解清晰！",
        },
        {
          "commentId": '1',
          "pubImg":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582650292681&di=ffb700c187c2586e8d0805600ff04917&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F21%2F20151121171154_KZL4N.jpeg",
          'pubName': 'lili',
          "receiveName": "李老师",
          "courseName": "数学趣味课堂",
          "pubDate": "2020年3月5日",
          'receiveImg':
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
          "star": "2",
          "pubWord": "老师教学认真，讲解清晰！",
        },
      ],
      'teacherName': '李老师',
      'teacherInfo': '多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
      'teacherPhone': '17666552555',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'startDate': '2020年02月03日',
    'endDate': '2020年02月14日',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg',
    'courseTime': [
      {'weekDay': '2', 'startTime': '8:00', 'endTime': '8:45'},
      {'weekDay': '2', 'startTime': '8:50', 'endTime': '9:35'},
      {'weekDay': '4', 'startTime': '9:40', 'endTime': '10:25'},
      {'weekDay': '4', 'startTime': '10:30', 'endTime': '10:15'},
    ],
    'coursePeopleNum': '20',
    'courseId': '5',
    'courseInfo': '名师辅导，一对一教学',
    'discount': '40',
    'coursePrice': '165',
  },
];

const homeworkData = [
  {
    "homeworkId": "1",
    "homeworkTitle": "完成美术写作作业6张，其中画风景画2张,实物图4张",
    "courseName": "美术趣味课堂",
    "status": '0',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成美术作业6张图，其中包括2张风景图，4张
实物图，风景图画春夏秋冬四季各选两个季节的
同一风景，实物图任选家中家具完成。拍照上传
图片提交。
   ''',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    "courseImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615550&di=46ddb063125016fea02608d68824260d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201811%2F22%2F20181122150845_zkhid.thumb.700_0.jpg",
    'endDate': '2020,3,5',
  },
  {
    "homeworkId": "2",
    "homeworkTitle": "完成美术写作作业6张，其中画风景画2张,实物图4张",
    "courseName": "美术趣味课堂",
    "status": '1',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成美术作业6张图，其中包括2张风景图，4张
实物图，风景图画春夏秋冬四季各选两个季节的
同一风景，实物图任选家中家具完成。拍照上传
图片提交。
   ''',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "pubImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514941&di=e9e4873d161571b52bea030f7245d754&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F180408%2F1-1P40Q63534.jpg,https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514941&di=e9e4873d161571b52bea030f7245d754&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F180408%2F1-1P40Q63534.jpg",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,3,10',
    "courseImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg"
  },
  {
    "homeworkId": "3",
    "homeworkTitle": "完成美术写作作业6张，其中画风景画2张,实物图4张",
    "courseName": "美术趣味课堂",
    "status": '2',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成美术作业6张图，其中包括2张风景图，4张
实物图，风景图画春夏秋冬四季各选两个季节的
同一风景，实物图任选家中家具完成。拍照上传
图片提交。
   ''',
    'submitDate': '2020,3,1',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "pubImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514941&di=e9e4873d161571b52bea030f7245d754&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F180408%2F1-1P40Q63534.jpg",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,3,9',
    "courseImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg"
  },
  {
    "homeworkId": "4",
    "homeworkTitle": "完成美术写作作业6张，其中画风景画2张,实物图4张",
    "courseName": "美术趣味课堂",
    "status": '0',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成美术作业6张图，其中包括2张风景图，4张
实物图，风景图画春夏秋冬四季各选两个季节的
同一风景，实物图任选家中家具完成。拍照上传
图片提交。
   ''',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "pubImg": "",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,2,5',
    "courseImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg"
  },
  {
    "homeworkId": "5",
    "homeworkTitle": "完成美术写作作业6张，其中画风景画2张,实物图4张",
    "courseName": "趣味数学课",
    "status": '0',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成美术作业6张图，其中包括2张风景图，4张
实物图，风景图画春夏秋冬四季各选两个季节的
同一风景，实物图任选家中家具完成。拍照上传
图片提交。
   ''',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "pubImg": "",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,3,5',
    "courseImg":
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=798274737,3062737828&fm=26&gp=0.jpg"
  },
  {
    "homeworkId": "6",
    "homeworkTitle": "完成课堂上的应用题目，复习教过的内容，熟记公式。",
    "courseName": "趣味数学课",
    "status": '0',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '张老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成课堂上的应用题目，复习教过的内容，熟记公式。
   ''',
    "pubDate": "2020,3,1",
    "pubContent": "hahaha",
    "pubImg": "",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,3,5',
    "courseImg":
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=798274737,3062737828&fm=26&gp=0.jpg"
  },
  {
    "homeworkId": "7",
    "homeworkTitle": "完成课堂上的应用题目，复习教过的内容，熟记公式。",
    "courseName": "趣味数学课",
    "status": '2',
    "pubVideo": "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    'courseTeacher': {
      'teacherName': '张老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    "homeworkContent": '''
   完成课堂上的应用题目，复习教过的内容，熟记公式。
   ''',
    "pubDate": "2020,2,1",
    "pubContent": "hahaha",
    "pubImg": "",
    "homeworkGrade": "98",
    "teacherComment": "下次继续努力",
    'endDate': '2020,2,5',
    "courseImg":
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=798274737,3062737828&fm=26&gp=0.jpg"
  },
];

const tableList = [
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'startTime': '8:00',
    'endTime': '8:45',
    'courseDate': '2020,2,10',
    'courseStatus': '1',
    'tableId': '15',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseDate': '2020,2,10',
    'tableId': '16',
    'startTime': '8:50',
    'endTime': '9:35',
    'courseStatus': '1'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'tableId': '17',
    'startTime': '8:00',
    'endTime': '8:45',
    'courseDate': '2020,2,15',
    'courseStatus': '2'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'tableId': '18',
    'courseDate': '2020,2,15',
    'startTime': '8:50',
    'endTime': '9:35',
    'courseStatus': '2'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'startTime': '8:00',
    'endTime': '8:45',
    'courseDate': '2020,3,10',
    'courseStatus': '0',
    'tableId': '1',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseDate': '2020,3,10',
    'tableId': '2',
    'startTime': '8:50',
    'endTime': '9:35',
    'courseStatus': '0'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'tableId': '3',
    'startTime': '8:00',
    'endTime': '8:45',
    'courseDate': '2020,3,15',
    'courseStatus': '0'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'tableId': '4',
    'courseDate': '2020,3,15',
    'startTime': '8:50',
    'endTime': '9:35',
    'courseStatus': '0'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'tableId': '5',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseDate': '2020,3,15',
    'courseStatus': '0',
    'startTime': '9:40',
    'endTime': '10:25',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'tableId': '6',
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseStatus': '0',
    'courseDate': '2020,3,15',
    'startTime': '10:30',
    'endTime': '11:15'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '7',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseStatus': '0',
    'courseDate': '2020,3,10',
    'startTime': '9:40',
    'endTime': '10:25',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '8',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseStatus': '0',
    'courseDate': '2020,3,10',
    'startTime': '10:30',
    'endTime': '11:15'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'tableId': '9',
    'courseStatus': '1',
    'courseDate': '2020,3,17',
    'startTime': '9:40',
    'endTime': '10:25',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '10',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620916&di=983e9e6d005c188c34f789fabdd7e703&imgtype=0&src=http%3A%2F%2Fpic124.nipic.com%2Ffile%2F20170315%2F21511972_100511950000_2.jpg',
    'courseStatus': '0',
    'courseDate': '2020,3,17',
    'startTime': '10:30',
    'endTime': '11:15'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '11',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'courseDate': '2020,4,12',
    'courseStatus': '0',
    'startTime': '9:40',
    'endTime': '10:25',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '12',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'courseDate': '2020,4,12',
    'courseStatus': '0',
    'startTime': '10:30',
    'endTime': '11:15'
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '13',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'courseDate': '2020,4,12',
    'courseStatus': '0',
    'startTime': '9:40',
    'endTime': '10:25',
  },
  {
    'courseName': '美术趣味课堂',
    'courseHours': '48',
    'tableId': '14',
    'courseTeacher': {
      'teacherName': '李老师',
      'teacherImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
    },
    'courseImg':
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582547620913&di=7e280c16e9c8484f2e7595fca91958f3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F64ffa5f9e7da65d5f3e99d55de3c3a0d6064051132c05-UWUrtF_fw658',
    'courseDate': '2020,4,12',
    'courseStatus': '0',
    'startTime': '10:30',
    'endTime': '11:15'
  },
];

const growUp = [
  {
    "pubDate": "2020,3,1,22,22,22",
    "pubVideo":
        "https://vdept.bdstatic.com/534c5749536c6358597473614262314a/3657464573677331/74b2ee243b7ce7aa6efc468ac7fb3845969fdca1a60a2cc2bbe278110aab6b4912f9d4b9d27a9c60c6932c60882556dc.mp4?auth_key=1583132410-0-0-fa98585f96201751da7844c5befb2d7d",
    "pubImg":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514941&di=e9e4873d161571b52bea030f7245d754&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fallimg%2F180408%2F1-1P40Q63534.jpg,https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396514940&di=9ae7e71d6f8b8a655ca90d9ef630022f&imgtype=0&src=http%3A%2F%2Fimg1.maka.im%2Fuser%2F521311600b41677ab197d562665ace1fd9fddcf.jpg",
    "pubWord": "今天课程十分有意思，我掌握了许多新知识，比如。。。",
    "growUpId":'1',
  },
];
