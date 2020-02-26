const btnData = [
  {"key": "all", "value": "全部"},
  {"key": "math", "value": "数学"},
  {"key": "chinese", "value": "语文"},
  {"key": "eng", "value": "英语"},
  {"key": "art", "value": "美术"},
  {"key": "phy", "value": "物理"},
  {"key": "music", "value": "音乐"},
  {"key": "dance", "value": "舞蹈"},
  {"key": "che", "value": "化学"},
];

const courseData = [
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
        'teacherInfo':'多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
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
        'teacherInfo':'多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
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
            "star": "3",
            "pubWord": "老师教学认真，讲解清晰！",
          },
        ],
        'teacherName': '李老师',
        'teacherInfo':'多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
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
            "star": "2",
            "pubWord": "老师教学认真，讲解清晰！",
          },
        ],
        'teacherName': '李老师',
        'teacherInfo':'多年教学经验，有幽默的讲课风格，学生成绩提高显著。毕业于XXX师范大学，硕士学历。',
        'teacherPhone': '17666552555',
        'teacherImg':
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582396615546&di=8d9dcce6e55d029443db04901ed30c61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201903%2F10%2F20190310221844_guuus.thumb.700_0.jpg',
      },
      'course'
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
