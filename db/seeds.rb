# # adminユーザーのサンプル設定
User.create!(name:  "Riho Okubo",
             email: "rihoohkubo1002@gmail.com",
             password:              "rihoriho",
             password_confirmation: "rihoriho",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 99人分のサンプルユーザー
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#relationshipsのサンプル
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# #coursesのサンプル
categories = [{
    title: "FORT, FORC",
    description: "[強い、力]"
  }, {
    title: "NORM",
    description: "[基準]"
  }, {
    title: "MIT, MISS",
    description: "[送る]"
  }, {
    title: "PAR, PEAR",
    description: "[現れる]"
  }, {
    title: "SCRIBE, SCRIPT",
    description: "[書く]"
  }, {
    title: "RECT,REG",
    description: "[支配する、正しい]"
  }
]

#wordsとword_answersのサンプル
words_1 = [
  {
    content: "discomfort", 
    word_answers_attributes: [
      { content: "hardship", correct: true },
      { content: "charm" },
      { content: "attractiveness" },
      { content: "flexibility" }
    ]}, {
    content: "effort",
    word_answers_attributes: [
      { content: "attempt", correct: true },
      { content: "challenge" }, 
      { content: "effect" },
      { content: "influence" }
    ]}, {
    content: "effortless",
    word_answers_attributes: [
      { content: "difficult" },
      { content: "sordid" },
      { content: "facile", correct: true },
      { content: "slick" }
    ]}, {
    content: "force",
    word_answers_attributes: [
      { content: "vacuum" },
      { content: "stage" },
      { content: "energy", correct: true },
      { content: "fatigue" }
    ]}, {
    content: "forced",
    word_answers_attributes: [
      { content: "shabby" },
      { content: "swampy" },
      { content: "compulsory", correct: true },
      { content: "interrelate" }
    ]}, {
    content: "forceful",
    word_answers_attributes: [
      { content: "accidental" },
      { content: "maginal" },
      { content: "unanimous" },
      { content: "powerful", correct: true }
    ]}
] 

words_2 = [
  {
    content: "abnormal", 
    word_answers_attributes: [
      { content: "extraordinary", correct: true },
      { content: "unintentionallt" },
      { content: "famous" },
      { content: "secure" }
    ]}, {
    content: "enormous",
    word_answers_attributes: [
      { content: "gigantic", correct: true },
      { content: "serene" }, 
      { content: "sheer" },
      { content: "nomadic" }
    ]}, {
    content: "normalize",
    word_answers_attributes: [
      { content: "curtail" },
      { content: "discard" },
      { content: "standardize", correct: true },
      { content: "classify" }
    ]}
]

words_3 = [
  {
    content: "admittance", 
    word_answers_attributes: [
      { content: "access", correct: true },
      { content: "recognition" },
      { content: "creation" },
      { content: "ignorance" }
    ]}, {
    content: "demise",
    word_answers_attributes: [
      { content: "extinction", correct: true },
      { content: "acknowledge" }, 
      { content: "introduction" },
      { content: "educator" }
    ]}, {
    content: "dismiss",
    word_answers_attributes: [
      { content: "producer" },
      { content: "cutback" },
      { content: "discharge", correct: true },
      { content: "fluid" }
    ]}, {
    content: "emit",
    word_answers_attributes: [
      { content: "bewilder" },
      { content: "abhor" },
      { content: "issue", correct: true },
      { content: "coddle" }
    ]}, {
    content: "intermittently",
    word_answers_attributes: [
      { content: "cajole" },
      { content: "shrub" },
      { content: "sporadically", correct: true },
      { content: "tempest" }
    ]}, {
    content: "mission",
    word_answers_attributes: [
      { content: "bloom" },
      { content: "ignite" },
      { content: "puddle" },
      { content: "delegation", correct: true }
    ]}, {
    content: "omit",
    word_answers_attributes: [
      { content: "harvest" },
      { content: "trench" },
      { content: "exclud", correct: true },
      { content: "aggregation" }
    ]}, {
    content: "permission",
    word_answers_attributes: [
      { content: "orbit" },
      { content: "thorax" },
      { content: "sanction", correct: true },
      { content: "muscle" }
    ]}, {
    content: "remittance",
    word_answers_attributes: [
      { content: "digestion" },
      { content: "excretion" },
      { content: "remuneration", correct: true },
      { content: "background" }
    ]}, {
    content: "submit",
    word_answers_attributes: [
      { content: "metamorphosis" },
      { content: "undergo" },
      { content: "present", correct: true },
      { content: "drag" }
    ]}, {
    content: "submit",
    word_answers_attributes: [
      { content: "secrete" },
      { content: "wiggle" },
      { content: "yield", correct: true },
      { content: "concentrate" }
    ]}, {
    content: "transmit",
    word_answers_attributes: [
      { content: "grant" },
      { content: "ponder" },
      { content: "send", correct: true },
      { content: "flock" }
    ]}
]

words_4 = [
  {
    content: "apparently", 
    word_answers_attributes: [
      { content: "seemingly", correct: true },
      { content: "exclusivelt" },
      { content: "sullen" },
      { content: "wicked" }
    ]}, {
    content: "appear",
    word_answers_attributes: [
      { content: "seem", correct: true },
      { content: "thankful" }, 
      { content: "vicious" },
      { content: "underhand" }
    ]}, {
    content: "appearance",
    word_answers_attributes: [
      { content: "chromosome" },
      { content: "wrinkle" },
      { content: "advant", correct: true },
      { content: "synthesis" }
    ]}, {
    content: "disappear",
    word_answers_attributes: [
      { content: "curve" },
      { content: "establish" },
      { content: "vanish", correct: true },
      { content: "penetrate" }
    ]}
]

words_5 = [
  { 
    content: "describe", 
    word_answers_attributes: [
      { content: "prevail"},
      { content: "depict", correct: true },
      { content: "avoid" },
      { content: "disturb" }
    ]}, {
    content: "prescribe",
    word_answers_attributes: [
      { content: "order", correct: true },
      { content: "conclude" }, 
      { content: "disclose" },
      { content: "admire" }
    ]}
]

words_6 = [
  {
    content: "correct", 
    word_answers_attributes: [
      { content: "prepare" },
      { content: "separation" },
      { content: "region" },
      { content: "remedy", correct: true }
    ]}, {
    content: "direct",
    word_answers_attributes: [
      { content: "guide", correct: true },
      { content: "idirect" }, 
      { content: "register" },
      { content: "congested" }
    ]}, {
    content: "direct",
    word_answers_attributes: [
      { content: "gradual" },
      { content: "present" },
      { content: "candid", correct: true },
      { content: "essential" }
    ]}, {
    content: "erect",
    word_answers_attributes: [
      { content: "habit" },
      { content: "exhibit" },
      { content: "upright", correct: true },
      { content: "restore" }
    ]}, {
    content: "indirect",
    word_answers_attributes: [
      { content: "persistant" },
      { content: "original" },
      { content: "oblique", correct: true },
      { content: "disoriented" }
    ]}, {
    content: "irregular",
    word_answers_attributes: [
      { content: "consistent" },
      { content: "distant" },
      { content: "established" },
      { content: "erratic", correct: true }
    ]},
    {
    content: "region",
    word_answers_attributes: [
      { content: "apathy" },
      { content: "finance" },
      { content: "site", correct: true },
      { content: "action" }
    ]}, {
    content: "regular",
    word_answers_attributes: [
      { content: "actual" },
      { content: "constant" },
      { content: "steady", correct: true },
      { content: "intangible" }
    ]}, {
    content: "regularly",
    word_answers_attributes: [
      { content: "fairly" },
      { content: "inadvertently" },
      { content: "periodically", correct: true },
      { content: "approximately" }
    ]}, {
    content: "regulate",
    word_answers_attributes: [
      { content: "exploit" },
      { content: "abate" },
      { content: "prevent" },
      { content: "govern", correct: true }
    ]}
]

categories.each do |category|
  Category.create!(category)
end

category = Category.first
words_1.each do |word|
  category.words.create!(word)
end

category = Category.find(2)
words_2.each do |word|
  category.words.create!(word)
end

category = Category.find(3)
words_3.each do |word|
  category.words.create!(word)
end

category = Category.find(4)
words_4.each do |word|
  category.words.create!(word)
end

category = Category.find(5)
words_5.each do |word|
  category.words.create!(word)
end

category = Category.find(6)
words_6.each do |word|
  category.words.create!(word)
end













