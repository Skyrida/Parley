# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CommentSwipeUser.destroy_all
Argument.destroy_all
Reflection.destroy_all
Message.destroy_all
Chatroom.destroy_all
Debate.destroy_all
User.destroy_all

users = []
10.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "user#{i + 1}",
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    gender: ['Male', 'Female', 'Other'].sample,
    email: "user#{i + 1}@gmail.com",
    password: "123123"
  )
  user.save!
  users << user
end

# debates = []
# users.each do |user|
#   3.times do
#     debate = Debate.new(
#       title: Faker::Lorem.paragraph_by_chars(number: 49, supplemental: false),
#       description: Faker::Lorem.paragraph_by_chars(number: 199, supplemental: false),
#       user_id: user.id
#     )
#     debate.tag_list.add("awesome", "fake")
#     debate.save!
#     debates << debate
#   end
# end

debate_content = [
  { title: "A college degree is essential for getting a good job.", user_id: User.first.id, tag_list: ["Education", "Employment"], description: "Most students feel like they need a college degree in order to obtain a job, but how true is this?"},
  { title: "College should be free for everyone.", user_id: User.first.id, tag_list: ["College", "Tuition"], description: "A good education is the best way to move oneself forward in society"},
  { title: "Gay people should be allowed to adopt children.", user_id: User.first.id, tag_list: ["LGBTQ+", "Adoption"], description: "All human beings should be allowed to care for other human beings, regardless of their gender or sexual orientation"},
  { title: "Healthcare should be universal.", user_id: User.first.id, tag_list: ["Healthcare", "Human Rights"], description: "Should everyone be able to access healthcare, is there an inherent level of unfairness for the poor?"},
  { title: "Voting should be mandatory for all citizens.", user_id: User.first.id, tag_list: ["Politics", "Voting"], description: "Getting one’s voice heard is important for societal progress, but should you be forced to give your voice?"},
  { title: "Abortion should be available to all women.", user_id: User.first.id, tag_list: ["Abortion", "Women’s rights"], description: "If it is your body, surely it is your choice?"},
  { title: "Barbie is a good role model for young girls.", user_id: User.first.id, tag_list: ["Barbie", "Role models"], description: "Barbie has been around for generations, has she largely had a positive or negative impact?"},
  { title: "Burning the flag should be illegal.", user_id: User.first.id, tag_list: ["Flag", "Justice"], description: "Burning is an act of freedom of expression, but is it detrimental to societal stability at large?"},
  { title: "Can censorship ever be justified?", user_id: User.first.id, tag_list: ["Censorship", "Government"], description: "Information is power but sometimes ignorance can be bliss, which is better?"},
  { title: "Should more students attend community college?", user_id: User.first.id, tag_list: ["Students", "Community college"], description: "It is a cost effective way to study though it does also come with stigmas attached"},
  { title: "Schools should have armed guards.", user_id: User.first.id, tag_list: ["Schools", "Guns"], description: "Is this the best way to protect students at school or is it exposing them to more potential danger"},
  { title: "Schools should teach abstinence-only sex education?", user_id: User.first.id, tag_list: ["Schools", "Sex education"], description: "Should students be made aware of bodily functions from a young age or is ignorance bliss?"},
  { title: "Should genetic engineering be legal?", user_id: User.first.id, tag_list: ["Engineering", "Genetics"], description: "Is nature all powerful or should we extend our own power to try and manipulate it?"},
  { title: "Should human cloning be legalized?", user_id: User.first.id, tag_list: ["Cloning", "Human Rights"], description: "Perhaps this is a solution to the population problem or perhaps it’s a human rights cesspit waiting to happen"},
  { title: "Should insurance cover cosmetic procedures?", user_id: User.first.id, tag_list: ["Insurance", "Plastic surgery"], description: "Currently most medical insurances don’t cover plastic surgery"},
  { title: "Smoking should be banned.", user_id: User.first.id, tag_list: ["Smoking", "health"], description: "It’s been scientifically proven to be detrimental to health, but do positive social aspects outweigh that?"},
  { title: "Social media does more harm than good.", user_id: User.first.id, tag_list: ["Social media", "Health"], description: "It is a good way of staying in touch with people, but perhaps we’re now even further from reality"},
  { title: "Schools should teach LGBT+ inclusive sex education?", user_id: User.first.id, tag_list: ["LGBTQ+", "Education"], description: "It’s not detrimental to heterosexuals to teach it, so why wouldn’t you?"},
  { title: "Contact sports should be required in school.", user_id: User.first.id, tag_list: ["Rugby", "Schools"], description: "Does it increase the camaraderie or brain damage?"},
  { title: "Do you need homework in order to learn?", user_id: User.first.id, tag_list: ["Homework", "Education"], description: "Would time be better spent engaging in social/creative activities of one’s choosing or in further school learning?"},
  { title: "Education should be privatized.", user_id: User.first.id, tag_list: ["Private", "Education"], description: "Government historically has played a large role in public education, what would be the consequences if it didn’t?"},
  { title: "Does social media improve or impede communication?", user_id: User.first.id, tag_list: ["Social media", "Communication"], description: "We can contact faster, but is it less meaningful?"},
  { title: "Everyone should buy NFTs.", user_id: User.first.id, tag_list: ["NFTs", "Decentralize"], description: "Are they a great new investment opportunity or an already dying fad?"},
  { title: "Has social media benefitted or harmed people’s social lives?", user_id: User.first.id, tag_list: ["Social media", "Reality"], description: "Do you feel more or less connected now than you did a few years ago?"},
  { title: "Is technology going to save the world. . . or kill it?", user_id: User.first.id, tag_list: ["Technology", "World"], description: "Technology has played a huge role in getting humanity this far, but could it go too far"},
  { title: "Is technology making people dumber. . . or smarter?", user_id: User.first.id, tag_list: ["Intelligence", "technology"], description: "Are we learning from the technology, or is the technology enabling us to stop thinking?"},
  { title: "Is technology the opposite of nature? (Are technology and nature diametrically opposed?)", user_id: User.first.id, tag_list: ["Technology", "Nature"], description: "Diametrically opposed, foes - will they open doors to one another that were previously closed?"},
  { title: "Education should focus on maths and science rather than music and art.", user_id: User.first.id, tag_list: ["Sciences", "Art"], description: "Many of the most successful jobs currently are STEM based, but by focusing less of the arts are we losing something inherently human?"},
  { title: "Fast food should be banned in schools.", user_id: User.first.id, tag_list: ["fast food", "Health"], description: "Which outweighs more, health or fun and taste?"},
  { title: "Girls should be actively encouraged to enter STEM fields.", user_id: User.first.id, tag_list: ["Women", "Education"], description: "Science at its core is objective, so why should there be subjectivity and prejudice towards those who wish to study it?"},
  { title: "Homeschooling is better than traditional schooling.", user_id: User.first.id, tag_list: ["Education", "Alternatives"], description: "You learn what is deemed important for you, but is the person doing said deeming qualified to do it?"},
  { title: "Ivy league colleges are inherently better than other schools.", user_id: User.first.id, tag_list: ["Posh", "Education"], description: "They often get better results from their students, but are results everything?"},
  { title: "Public schools are better than private schools.", user_id: User.first.id, tag_list: ["Public", "Private"], description: "Is there an inherent unfairness here towards poorer students who don’t have access to these schools?"},
  { title: "Religion should be taught in schools.", user_id: User.first.id, tag_list: ["Religion", "Education"], description: "Will this cause indoctrination or inform students to make a decision that allows them to be spiritual and increase positivity?"},
  { title: "Should free STD testing be offered in schools?", user_id: User.first.id, tag_list: ["STD", "Education"], description: "Is it the school’s responsibility for a youth’s welfare, or does that fall to their guardians and themselves?"},
  { title: "Should standardized testing be abolished?", user_id: User.first.id, tag_list: ["Testing", "Fair"], description: "It’s a system which has stood the test of time but there have been calls in recent years as to its fairness on young adults"},
  { title: "School uniforms should be mandatory.", user_id: User.first.id, tag_list: ["Schools", "Uniform"], description: "It promotes a sense of unity and safety, but also conformity and results in a lack of expression for youths"},
  { title: "Student loans should be forgiven.", user_id: User.first.id, tag_list: ["Loans", "Students"], description: "Is this fair to those who have already paid for theirs, contrarily will it give former students a new lease of life?"},
  { title: "Studying a second language should be compulsory.", user_id: User.first.id, tag_list: ["Language", "Education"], description: "In a global world, knowing more than one language is incredibly useful - but should it be your choice?"},
  { title: "Teachers should be given guns to defend students.", user_id: User.first.id, tag_list: ["Guns", "Schools"], description: "Is this the best method of defence, does this create an even bigger fear culture?"},
  { title: "Teachers should be paid as much as doctors.", user_id: User.first.id, tag_list: ["Fair pay", "Teachers"], description: "Is one job categorically more important that the other?"},
  { title: "All people should be able to own guns.", user_id: User.first.id, tag_list: ["Guns", "Ownership"], description: "Emphasis on ALL people"},
  { title: "All prisons should be governmentally owned and run.", user_id: User.first.id, tag_list: ["Prison", "Government"], description: "Is it wrong to seek to profit over other humans for their misdoings?"},
  { title: "Britain should not have left the European Union.", user_id: User.first.id, tag_list: ["UK", "Brexit"], description: "Was BoJo correct?"},
  { title: "Capitalism is an inherently flawed political ideology.", user_id: User.first.id, tag_list: ["Capitalism", "Politics"], description: "In theory it provides all with opportunities, but are some getting left behind without possibility of betterment"},
  { title: "Are student loans exploitative?", user_id: User.first.id, tag_list: ["Exploition", "Students"], description: "Is it right to charge high fees for a good education?"},
  { title: "All students should have to purchase a laptop.", user_id: User.first.id, tag_list: ["Laptop", "Schools"], description: "Learning on technology is almost a necessity in the modern era, but is this fair to the poorer population?"},
  { title: "Boarding school is harmful to students.", user_id: User.first.id, tag_list: ["Learning", "Schools"], description: "It provides a good life experience, but also could increase likelihood of mental illness later down the line"},
  { title: "Cell phones should be banned in schools.", user_id: User.first.id, tag_list: ["Phones", "Schools"], description: "Students are there to learn, but are phones so inherent to life now that they can’t be taken away?"},
  { title: "Churches should pay taxes.", user_id: User.first.id, tag_list: ["Church", "Tax"], description: "Should they be classed as a business or a charity?"},
  { title: "Communism is an inherently flawed political ideology.", user_id: User.first.id, tag_list: ["Communism", "Politics"], description: "Sharing is caring until someone gets a bit too greedy for the pie?"},
  { title: "Is freedom of speech a necessity in a functional society?", user_id: User.first.id, tag_list: ["Freedom of Speech", "politics"], description: "People want to have their opinion heard, but can this sometimes cause greater evil than good?"},
  { title: "Is owning an automatic weapon morally justifiable?", user_id: User.first.id, tag_list: ["Ethics", "Guns"], description: "What situations in public society would one need an automatic AK-47?"},
  { title: "Is patriotism ultimately destructive to international relations?", user_id: User.first.id, tag_list: ["Patriotism", "Government"], description: "The world is becoming increasingly globalised, but isolationism isn’t always a bad thing"},
  { title: "Is the US voting system democratic?", user_id: User.first.id, tag_list: ["Democracy", "Voting"], description: "The heart of democracy with an electoral college system and money-fuelled campaigns"},
  { title: "Juries should include 24 jurors instead of 12.", user_id: User.first.id, tag_list: ["Justice", "Government"], description: "Too many cooks in the kitchen or more reliable to reach a good conclusion?"},
  { title: "Politics should be kept out of schools.", user_id: User.first.id, tag_list: ["Education", "Politics"], description: "Should students learn the system which they may grow up to hate?"},
  { title: "Presidential terms should be limited to two years instead of four.", user_id: User.first.id, tag_list: ["US Politics", "president"], description: "It’s more democratic as it gives the people a more regular say, but can anything significant be accomplished in a short amount of time"},
  { title: "Rich people and large corporations should pay more taxes.", user_id: User.first.id, tag_list: ["tax", "Socialism"], description: "They have more capacity but should societies worries be expected to be answered by a few"},
  { title: "Should illegal immigrants be treated as criminals?", user_id: User.first.id, tag_list: ["Justice", "Immigration"], description: "The world is a global place, but do borders still mean something?"},
  { title: "Should the U.N. have a standing army?", user_id: User.first.id, tag_list: ["UN", "Army"], description: "Does this promote peace or rather just deterrence?"},
  { title: "Should the voting age be lowered to 16?", user_id: User.first.id, tag_list: ["Voting", "Teenagers"], description: "Young adults opinions of course count, but at 16 are they too young to formulate a well-judged opinion?"},
  { title: "Should there be limits on the First Amendment (free speech)?", user_id: User.last.id, tag_list: ["Free speech", "Hate speech"], description: "Free speech is a bedrock of democracy, but there are points perhaps where it should be limited such as transitioning to hate speech"},
  { title: "Should there be more religion in politics?", user_id: User.last.id, tag_list: ["Religion", "Politics"], description: "Does religion provide guidance or cloud people’s judgements of modern day issues by age old doctrine?"},
  { title: "Should your country make a land claim on Antarctica?", user_id: User.last.id, tag_list: ["Antarctica", "Politics"], description: "There are resources there but perhaps it should be left and remain as the final frontier"},
  { title: "The British Monarchy should be abolished.", user_id: User.last.id, tag_list: ["Queen", "Abolition"], description: "The Queen is a good status head, but are they worth the tax money provided to them through Her Majesty’s Treasury?"},
  { title: "The country should allow more refugees to enter.", user_id: User.last.id, tag_list: ["Refugees", "Crisis"], description: "Is the ‘steal your jobs’ moniker fear mongering or does it have a semblance of truth?"},
  { title: "The U.S. should intervene in overseas conflicts.", user_id: User.last.id, tag_list: ["US", "War"], description: "They have the capacity to be ‘peacekeepers’ but perhaps they’re seeking personal gain rather than peace"},
  { title: "The US should abolish the electoral college.", user_id: User.last.id, tag_list: ["US Politics", "Fairness"], description: "Is it unfair and undemocratic, or is it the balancer to the states which are deemed more powerful?"},
  { title: "The West should lift all sanctions on Iran (or North Korea).", user_id: User.last.id, tag_list: ["Sanctions", "North Korea"], description: "For them to better themselves they can’t be isolated, but with their regimes maybe they shouldn’t be given the chance to get better"},
  { title: "Vaccination should be mandatory.", user_id: User.last.id, tag_list: ["Vaccines", "Government"], description: "From a health perspective, this is arguably best for everyone, but should you have autonomy over your own body - sole over society"},
  { title: "Censorship is sometimes warranted on the internet.", user_id: User.last.id, tag_list: ["Censorship", "internet"], description: "Should we be exposed to everything or fear not being exposed to some things?"},
  { title: "Companies should be required to hire 50% male and 50% female employees.", user_id: User.last.id, tag_list: ["Gender equality", "Corporate"], description: "Is it right to meet quotas in order to beat a prejudice which indeed has been entrenched, or should people be hired on merit regardless of other factors"},
  { title: "Drug addicts should be helped rather than punished.", user_id: User.last.id, tag_list: ["Drugs", "Health"], description: "Are these people dangerous or just in need of some TLC?"},
  { title: "Drug use should be treated as a mental health issue rather than a criminal offense.", user_id: User.last.id, tag_list: ["Drugs", "Mental health"], description: "Mental health is becoming rightfully so a more important issue, and a lot of drug cases are linked to those with these issues preexisting"},
  { title: "Euthanasia should be legal.", user_id: User.last.id, tag_list: ["Euthanasia", "Laws"], description: "Should you have the autonomy and freedom over yourself to take your own life?"},
  { title: "Gay marriage should be legalized.", user_id: User.last.id, tag_list: ["LGBTQ+", "Law"], description: "What does other people’s love have to do with you?"},
  { title: "Is graffiti art just as worthy of regard as classical paintings?", user_id: User.last.id, tag_list: ["Art", "Graffiti"], description: "Banksy collections are just as popular as some famous classical painters"},
  { title: "Is privacy important?", user_id: User.last.id, tag_list: ["Privacy", "Cambridge Analytica"], description: "Given recent data scandals, how much do you value your data, both online and in real life?"},
  { title: "Marijuana should be legalized.", user_id: User.last.id, tag_list: ["Drugs", "Law"], description: "It has both economic and health pros and cons, as well as examples of world states which have legalised or outlawed it. Which of these dichotomous approaches is correct?"},
  { title: "Peer pressure is a good thing.", user_id: User.last.id, tag_list: ["Peer Pressure", "Youth"], description: "It can push you out of your comfort zone but it can also firmly root you to the status quo"},
  { title: "Police should be allowed to use deadly force.", user_id: User.last.id, tag_list: ["Police", "Violence"], description: "In some cases, perhaps it is warranted - but what are these cases?"},
  { title: "Religion does more harm than good.", user_id: User.last.id, tag_list: ["Religion", "God"], description: "There are many teachings we can learn from, but there are also many old traditions which perhaps no longer have a place in our society"},
  { title: "Sex work should be legal.", user_id: User.last.id, tag_list: ["Prostitution", "Legal"], description: "Is it too taboo for society or should consenting adults be free to pursue whatever career they please?"},
  { title: "The death penalty should be abolished.", user_id: User.last.id, tag_list: ["Capitol Punishment", "Death"], description: "Can an institution, group of people or even a single person have the authority to take another’s life away from them?"},
  { title: "The government should provide free birth control.", user_id: User.last.id, tag_list: ["Birth control", "government"], description: "On one hand, the government could do this and promote safe sex, on the other hand they could encourage population growth - which is more convincing?"},
  { title: "The harms of patriotism outweigh the benefits.", user_id: User.last.id, tag_list: ["Patriotism", "Populist"], description: "Many people feel a sense of pride and unity along with their country, but are borders old and do they promote too much disunity towards other peoples?"},
  { title: "The minimum wage should be lowered (or raised).", user_id: User.last.id, tag_list: ["Wage", "Law"], description: "Should you have to prove your worth or should you be guaranteed at least enough to be able to live off of without basic needs worries"},
  { title: "We're living in a dystopian society.", user_id: User.last.id, tag_list: ["Society", "Philosophy"], description: "Philosophically, what on Earth is going on? Or perhaps it all makes sense?"},
  { title: "Animals should have the same rights as humans.", user_id: User.last.id, tag_list: ["Animals", "Equality"], description: "Just by virtue of our intelligence and posable thumbs, does that make our life more important?"},
  { title: "Block-chain technology is harming the environment.", user_id: User.last.id, tag_list: ["Technology", "Environment"], description: "It will take up a vast amount of energy, but does it provide greater opportunity to combat the climate crisis?"},
  { title: "Climate change is the greatest threat in human history.", user_id: User.last.id, tag_list: ["Climate Change", "Extinction"], description: "Is nature scarier than man’s wars?"},
  { title: "Companies should be taxed on their carbon emissions and other negative environmental impacts.", user_id: User.last.id, tag_list: ["Tax", "Environment"], description: "Should we make them pay for the consequences they are leaving to us, or are their benefits outweighing this?"},
  { title: "Everyone should be vegetarian.", user_id: User.last.id, tag_list: ["Vegetarian", "Diet"], description: "The climate and social impact of meat consumption are strong, but so is its taste"},
  { title: "Everyone should purchase electric cars.", user_id: User.last.id, tag_list: ["Electric Cars", "Society"], description: "They’d benefit the environment but could the infrastructure keep pace along with other potential issues"},
  { title: "Fracking should be banned.", user_id: User.last.id, tag_list: ["Fracking", "Politics"], description: "We are in desperate need of more resources and energy, but is this permanent damage worth it?"},
  { title: "Is the Paris Agreement relevant anymore?", user_id: User.last.id, tag_list: ["Environment", "Trump"], description: "If Trump can bail on it, then surely we all can? No? Ok so why is it perhaps important?"},
  { title: "Is tourism beneficial to the environment?", user_id: User.last.id, tag_list: ["Tourism", "Environment"], description: "Tourism can promote conservation and appreciation, but travel etc. can cause an unwanted environmental cost"},
  { title: "More land should be dedicated as national parks.", user_id: User.last.id, tag_list: ["Environment", "Nature"], description: "Only a minute percentage of land is reserved for protected areas, should we continue building or allow nature some love?"},
  { title: "Nuclear energy is the solution to the overconsumption of fossil fuels.", user_id: User.last.id, tag_list: ["Nuclear", "Fossil fuels"], description: "It is a very efficient and available resource, but the horrors of Chernobyl still live on in the memory"},
  { title: "Plastic bags and packaging should be banned.", user_id: User.last.id, tag_list: ["Plastics", "Laws"], description: "They are very convenient but their lack of bio-degradability leaves a lot to be desired"},
  { title: "Solar power is the energy of the future.", user_id: User.last.id, tag_list: ["Energy", "Future"], description: "For some areas the sun is plentiful, but too many solar panels could be a blight on a sunny day"},
  { title: "The sale of fur should be banned.", user_id: User.last.id, tag_list: ["Fur", "Animals"], description: "It may be a fashion statement but there are so many alternatives out there, must we seek to kill animals for sport and fashion?"},
  { title: "Zoos should be banned.", user_id: User.last.id, tag_list: ["Animals", "Zoo"], description: "They can provide refuge and spaces for rehabilitation, but they can also treat animals poorly, reduce their freedom to nil and turn them into nothing more than a tourist attraction"},
  { title: "Artificial intelligence is dangerous.", user_id: User.last.id, tag_list: ["AI", "Future"], description: "It can allow us to learn more, but it could also learn too much about us"},
  { title: "Bitcoin will never replace traditional currency.", user_id: User.last.id, tag_list: ["Crypto", "Bitcoin"], description: "Are we too entrenched in fiat currencies to ever make a change, or is the desire for decentralisation just beginning?"},
  { title: "Block-chain technology is the future.", user_id: User.last.id, tag_list: ["Blockchain", "Future"], description: "Is it a flash in the pan or will it revolutionise the way all our systems work?"},
  { title: "Online schooling is the way of the future.", user_id: User.last.id, tag_list: ["Schools", "Technology"], description: "We saw during the pandemic the convenience of online schooling, but does it further detriment an already fragile social ecosystem for young people?"},
  { title: "Should a person's social media be considered by potential employers etc?", user_id: User.last.id, tag_list: ["Social media", "Privacy"], description: "Does a person sign away their private life to the public sphere when they commence social media, or should there be some segregation?"},
  { title: "Should humans colonize other planets?", user_id: User.last.id, tag_list: ["Space", "Colonial"], description: "We are on track with technology to have humans present on other planets in this century, do we have the rights to claim these frontiers for ourselves?"},
  { title: "Should individuals own their own DNA?", user_id: User.last.id, tag_list: ["DNA", "Human rights"], description: "Is it truly a part of you or merely something that makes you?"},
  { title: "Robots should have rights.", user_id: User.last.id, tag_list: ["Robots", "Laws"], description: "In many respects, some AIs are already more intelligent than the human psyche - despite a lack of emotion should they have the some rights given the argument of actual consciousness existing?"},
  { title: "Technology will be man's downfall.", user_id: User.last.id, tag_list: ["Technology", "Future"], description: "Humans have a tendency for greed and pushing the boat too far, will we learn from past mistakes or will this route be followed again?"},
  { title: "We should invest more money into space exploration.", user_id: User.last.id, tag_list: ["SpaceX", "NASA"], description: "It’s at the core of humans to want to explore, but could the money be better spent elsewhere?"},
  { title: "Abortion is a human right.", user_id: User.last.id, tag_list: ["Abortion", "Women’s Rights"], description: "But which human should be deemed more important?"},
  { title: "Advertising should be banned during children's programs.", user_id: User.last.id, tag_list: ["Ads", "TV"], description: "Children are very impressionable, but an entire industry is built around Christmas which relies on advertisements to kids"},
  { title: "Beauty pageants should be banned.", user_id: User.last.id, tag_list: ["Trump", "Girls"], description: "The children are surely not old enough to make the decision to subject themselves to a competition based purely on aesthetics"},
  { title: "Can animal testing be justified?", user_id: User.last.id, tag_list: ["Animals", "Science"], description: "Sometimes it can be to the benefit of mankind, but at what cost"},
  { title: "Children should be exposed to technology.", user_id: User.last.id, tag_list: ["Youths", "Technology"], description: "It is undeniably a cornerstone of modern day life, but perhaps there is an appropriate age to introduce it to them"},
  { title: "Gaming should be considered a sport.", user_id: User.last.id, tag_list: ["Gaming", "Sport"], description: "Esports are hugely popular now, but what does it actually take to become recognised as a sport per se"},
  { title: "Pop music is the best kind of music.", user_id: User.last.id, tag_list: ["Music", "Pop"], description: "By definition it is the most popular, but how does one measure the success and reach of music"},
  { title: "Should alcohol be sold after 10 pm?", user_id: User.last.id, tag_list: ["Alcohol", "Drugs"], description: "Fun versus public order, which is more important to a healthy society"},
  { title: "Reality television is harming society.", user_id: User.last.id, tag_list: ["TV", "Society"], description: "It provides light entertainment, but equally offers a distorted view and encourages procrastination"}
]
debates = []
debate_content.each do |debate|
  debate = Debate.new(debate)
  debate.save!
  debates << debate
end

# debates.each do |debate|
#   4.times do
#     argument_for = Argument.new(
#       content: Faker::Lorem.paragraph_by_chars(number: 190, supplemental: false),
#       user_id: User.first.id,
#       debate_id: debate.id,
#       perspective_pro: true
#     )
#     argument_for.save!
#     argument_against = Argument.new(
#       content: Faker::Lorem.paragraph_by_chars(number: 190, supplemental: false),
#       user_id: User.last.id,
#       debate_id: debate.id,
#       perspective_pro: false
#     )
#     argument_against.save!
#   end
# end

debates.each do |debate|
  argument_for1 = Argument.new(
    content: "This thesis must be true as the statistics show it as such",
    user_id: User.first.id,
    debate_id: debate.id,
    perspective_pro: true
  )
  argument_for1.save!

  argument_against1 = Argument.new(
    content: "Not true, the way that the data is collected is completely unfair and unjust",
    user_id: User.last.id,
    debate_id: debate.id,
    perspective_pro: false
  )
  argument_against1.save!

  argument_for2 = Argument.new(
    content: "I feel strongly pro about this given that I have had first hand experience with the situation",
    user_id: User.first.id,
    debate_id: debate.id,
    perspective_pro: true
  )
  argument_for2.save!

  argument_against2 = Argument.new(
    content: "I'd argue that that's a leading question and it's misdirecting people's opinions on the matter",
    user_id: User.last.id,
    debate_id: debate.id,
    perspective_pro: false
  )
  argument_against2.save!

  argument_for3 = Argument.new(
    content: "The law is clear on the subject, and one should always follow what the law says",
    user_id: User.first.id,
    debate_id: debate.id,
    perspective_pro: true
  )
  argument_for3.save!

  argument_against3 = Argument.new(
    content: "The statistics show this thesis to be a complete falsehood",
    user_id: User.last.id,
    debate_id: debate.id,
    perspective_pro: false
  )
  argument_against3.save!

  argument_for4 = Argument.new(
    content: "The cost of such a thing is fairly minimal and so should strongly be considered",
    user_id: User.first.id,
    debate_id: debate.id,
    perspective_pro: true
  )
  argument_for4.save!

  argument_against4 = Argument.new(
    content: "This should be an issue for the individual to decide, and not one taken by a collective party",
    user_id: User.last.id,
    debate_id: debate.id,
    perspective_pro: false
  )
  argument_against4.save!
end
