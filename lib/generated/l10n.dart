// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Connection to server failed`
  String get connectionToServerFailed {
    return Intl.message(
      'Connection to server failed',
      name: 'connectionToServerFailed',
      desc: '',
      args: [],
    );
  }

  /// `requestToTheServerWasCancelled`
  String get requestToTheServerWasCancelled {
    return Intl.message(
      'requestToTheServerWasCancelled',
      name: 'requestToTheServerWasCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with the server`
  String get connectionTimeoutWithTheServer {
    return Intl.message(
      'Connection timeout with the server',
      name: 'connectionTimeoutWithTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Connection to the server failed due to internet connection`
  String get connectionToTheServerFailedDueToInternetConnection {
    return Intl.message(
      'Connection to the server failed due to internet connection',
      name: 'connectionToTheServerFailedDueToInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout in connection with the server`
  String get receiveTimeOutInConnectionWithTheServer {
    return Intl.message(
      'Receive timeout in connection with the server',
      name: 'receiveTimeOutInConnectionWithTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout in connection with the server`
  String get sendTimeoutInConnectionWithTheServer {
    return Intl.message(
      'Send timeout in connection with the server',
      name: 'sendTimeoutInConnectionWithTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error occurred`
  String get UnexpectedErrorOccurred {
    return Intl.message(
      'Unexpected error occurred',
      name: 'UnexpectedErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `ubitarts`
  String get Ubitarts {
    return Intl.message('ubitarts', name: 'Ubitarts', desc: '', args: []);
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message('Welcome', name: 'Welcome', desc: '', args: []);
  }

  /// `Choose`
  String get Choose {
    return Intl.message('Choose', name: 'Choose', desc: '', args: []);
  }

  /// `WHAT SERVICE\nYOU NEED`
  String get WhatYouNeed {
    return Intl.message(
      'WHAT SERVICE\nYOU NEED',
      name: 'WhatYouNeed',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Create Account`
  String get CreateAccount {
    return Intl.message(
      'Create Account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGNUP {
    return Intl.message('SIGN UP', name: 'SIGNUP', desc: '', args: []);
  }

  /// `Enter Your Username`
  String get EnterYourUsername {
    return Intl.message(
      'Enter Your Username',
      name: 'EnterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get EnterYourPhoneNumber {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'EnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get EnterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get LoginwithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'LoginwithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get LoginwithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'LoginwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get SIGNIN {
    return Intl.message('SIGN IN', name: 'SIGNIN', desc: '', args: []);
  }

  /// `Already have an account?`
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account?',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Enter Your Username / Email`
  String get EnterYourUsernameEmail {
    return Intl.message(
      'Enter Your Username / Email',
      name: 'EnterYourUsernameEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `SignUp with Facebook`
  String get SignUpwithFacebook {
    return Intl.message(
      'SignUp with Facebook',
      name: 'SignUpwithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `SignUp with Google`
  String get SignUpwithGoogle {
    return Intl.message(
      'SignUp with Google',
      name: 'SignUpwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get Donthaveanaccount {
    return Intl.message(
      'Don’t have an account? ',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Password must be at least : 8+ chars, 1 uppercase, 1 lowercase,\n1 number, 1 special (!@#\$&*)`
  String get Enteravalidpassword {
    return Intl.message(
      'Password must be at least : 8+ chars, 1 uppercase, 1 lowercase,\n1 number, 1 special (!@#\\\$&*)',
      name: 'Enteravalidpassword',
      desc: '',
      args: [],
    );
  }

  /// `Must not be empty`
  String get Mustnotbeempty {
    return Intl.message(
      'Must not be empty',
      name: 'Mustnotbeempty',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get Tryagain {
    return Intl.message('Try again', name: 'Tryagain', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Phone`
  String get Phone {
    return Intl.message('Phone', name: 'Phone', desc: '', args: []);
  }

  /// `We have sent you a recover link to\nchange your password`
  String get RecoverySent {
    return Intl.message(
      'We have sent you a recover link to\nchange your password',
      name: 'RecoverySent',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message('Resend', name: 'Resend', desc: '', args: []);
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email to send you\nRecover Link`
  String get ChooseRecovery {
    return Intl.message(
      'Enter your Email to send you\nRecover Link',
      name: 'ChooseRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get EnterPassword {
    return Intl.message(
      'Enter your new password',
      name: 'EnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Hello`
  String get Hello {
    return Intl.message('Hello', name: 'Hello', desc: '', args: []);
  }

  /// `Created by`
  String get Createdby {
    return Intl.message('Created by', name: 'Createdby', desc: '', args: []);
  }

  /// `Qubitarts Blog`
  String get QubitartsBlog {
    return Intl.message(
      'Qubitarts Blog',
      name: 'QubitartsBlog',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get SeeMore {
    return Intl.message('See More', name: 'SeeMore', desc: '', args: []);
  }

  /// `Media Zone`
  String get MediZone {
    return Intl.message('Media Zone', name: 'MediZone', desc: '', args: []);
  }

  /// `Type Here`
  String get TypeHere {
    return Intl.message('Type Here', name: 'TypeHere', desc: '', args: []);
  }

  /// `Choose Industry`
  String get ChooseIndustry {
    return Intl.message(
      'Choose Industry',
      name: 'ChooseIndustry',
      desc: '',
      args: [],
    );
  }

  /// `What industry Your Business is?`
  String get WhatindustryYourBusinessis {
    return Intl.message(
      'What industry Your Business is?',
      name: 'WhatindustryYourBusinessis',
      desc: '',
      args: [],
    );
  }

  /// `Pick an Industry`
  String get PickanIndustry {
    return Intl.message(
      'Pick an Industry',
      name: 'PickanIndustry',
      desc: '',
      args: [],
    );
  }

  /// `Swipe Left For Next Question`
  String get SwipeLeftForNextQuestion {
    return Intl.message(
      'Swipe Left For Next Question',
      name: 'SwipeLeftForNextQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message('Done', name: 'Done', desc: '', args: []);
  }

  /// `Website Service`
  String get WebsiteService {
    return Intl.message(
      'Website Service',
      name: 'WebsiteService',
      desc: '',
      args: [],
    );
  }

  /// `Open the FinX Stock app to get started \nand follow the steps.`
  String get OpentheFinXStockapptogetstartedand {
    return Intl.message(
      'Open the FinX Stock app to get started \nand follow the steps.',
      name: 'OpentheFinXStockapptogetstartedand',
      desc: '',
      args: [],
    );
  }

  /// `1.Brain Storming the idea`
  String get BrainStormingtheidea {
    return Intl.message(
      '1.Brain Storming the idea',
      name: 'BrainStormingtheidea',
      desc: '',
      args: [],
    );
  }

  /// `2.Designing the Website`
  String get DesigningtheWebsite {
    return Intl.message(
      '2.Designing the Website',
      name: 'DesigningtheWebsite',
      desc: '',
      args: [],
    );
  }

  /// `3.Approving the project`
  String get Approvingtheproject {
    return Intl.message(
      '3.Approving the project',
      name: 'Approvingtheproject',
      desc: '',
      args: [],
    );
  }

  /// `4.Developing the website`
  String get Developingthewebsite {
    return Intl.message(
      '4.Developing the website',
      name: 'Developingthewebsite',
      desc: '',
      args: [],
    );
  }

  /// `See previous Works`
  String get SeepreviousWorks {
    return Intl.message(
      'See previous Works',
      name: 'SeepreviousWorks',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message('Start', name: 'Start', desc: '', args: []);
  }

  /// `Website`
  String get Website {
    return Intl.message('Website', name: 'Website', desc: '', args: []);
  }

  /// `What is Your\nBusiness Name?`
  String get WhatisYourBusinessName {
    return Intl.message(
      'What is Your\nBusiness Name?',
      name: 'WhatisYourBusinessName',
      desc: '',
      args: [],
    );
  }

  /// `Write your Business or Company \nName?`
  String get WriteyourBusinessorCompanyName {
    return Intl.message(
      'Write your Business or Company \nName?',
      name: 'WriteyourBusinessorCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `What features or functionalities do you\nneed (e.g., contact forms, e-commerce,\n blog)?`
  String get Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog {
    return Intl.message(
      'What features or functionalities do you\nneed (e.g., contact forms, e-commerce,\n blog)?',
      name: 'Whatfeaturesorfunctionalitiesdoyouneedcontactformsecommerceblog',
      desc: '',
      args: [],
    );
  }

  /// `What is your preferred domain name\n (if you have one)?`
  String get Whatisyourpreferreddomainnameifyouhaveone {
    return Intl.message(
      'What is your preferred domain name\n (if you have one)?',
      name: 'Whatisyourpreferreddomainnameifyouhaveone',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Domain if you Have`
  String get WriteDomainifyouHave {
    return Intl.message(
      'Write Your Domain if you Have',
      name: 'WriteDomainifyouHave',
      desc: '',
      args: [],
    );
  }

  /// `See Your Questions`
  String get SeeYourQuestions {
    return Intl.message(
      'See Your Questions',
      name: 'SeeYourQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Time Frame`
  String get TimeFrame {
    return Intl.message('Time Frame', name: 'TimeFrame', desc: '', args: []);
  }

  /// `Gallery`
  String get Gallary {
    return Intl.message('Gallery', name: 'Gallary', desc: '', args: []);
  }

  /// `Quotation`
  String get Quotation {
    return Intl.message('Quotation', name: 'Quotation', desc: '', args: []);
  }

  /// `Contract`
  String get Contract {
    return Intl.message('Contract', name: 'Contract', desc: '', args: []);
  }

  /// `Payment`
  String get Payment {
    return Intl.message('Payment', name: 'Payment', desc: '', args: []);
  }

  /// `Is Your Business\nNew or Old in the Market?`
  String get IsYourBusinessNeworOldintheMarket {
    return Intl.message(
      'Is Your Business\nNew or Old in the Market?',
      name: 'IsYourBusinessNeworOldintheMarket',
      desc: '',
      args: [],
    );
  }

  /// `Describe Your\nBusiness..`
  String get DescribeYourBusiness {
    return Intl.message(
      'Describe Your\nBusiness..',
      name: 'DescribeYourBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Describe what your business do and \nany details you want us to know`
  String get Describewhatyourbusinessdoandanydetailsyouwantustoknow {
    return Intl.message(
      'Describe what your business do and \nany details you want us to know',
      name: 'Describewhatyourbusinessdoandanydetailsyouwantustoknow',
      desc: '',
      args: [],
    );
  }

  /// `Do you need assistance with domain \nregistration and hosting setup?`
  String get Doassistancewithdomainregistration {
    return Intl.message(
      'Do you need assistance with domain \nregistration and hosting setup?',
      name: 'Doassistancewithdomainregistration',
      desc: '',
      args: [],
    );
  }

  /// `What is the timeline for launching the website?`
  String get Whattimelinelaunchingthewebsite {
    return Intl.message(
      'What is the timeline for launching the website?',
      name: 'Whattimelinelaunchingthewebsite',
      desc: '',
      args: [],
    );
  }

  /// `Will you provide high-resolution \nimages for the website?`
  String get Willprovideimagesforthewebsite {
    return Intl.message(
      'Will you provide high-resolution \nimages for the website?',
      name: 'Willprovideimagesforthewebsite',
      desc: '',
      args: [],
    );
  }

  /// `Choose deadline `
  String get Choosedeadline {
    return Intl.message(
      'Choose deadline ',
      name: 'Choosedeadline',
      desc: '',
      args: [],
    );
  }

  /// `Is there anything else you'd like to share about your vision for digital marketing?`
  String get Isthereanythingaboutyourvisionfordigitalmarketing {
    return Intl.message(
      'Is there anything else you\'d like to share about your vision for digital marketing?',
      name: 'Isthereanythingaboutyourvisionfordigitalmarketing',
      desc: '',
      args: [],
    );
  }

  /// `Finally\n`
  String get Finally {
    return Intl.message('Finally\n', name: 'Finally', desc: '', args: []);
  }

  /// `Click to upload`
  String get Clicktoupload {
    return Intl.message(
      'Click to upload',
      name: 'Clicktoupload',
      desc: '',
      args: [],
    );
  }

  /// `we `
  String get We {
    return Intl.message('we ', name: 'We', desc: '', args: []);
  }

  /// `have\n`
  String get have {
    return Intl.message('have\n', name: 'have', desc: '', args: []);
  }

  /// `Finished`
  String get Finished {
    return Intl.message('Finished', name: 'Finished', desc: '', args: []);
  }

  /// `Back To Home`
  String get BackToHome {
    return Intl.message('Back To Home', name: 'BackToHome', desc: '', args: []);
  }

  /// `Start Date:`
  String get StartDate {
    return Intl.message('Start Date:', name: 'StartDate', desc: '', args: []);
  }

  /// `Status:`
  String get Status {
    return Intl.message('Status:', name: 'Status', desc: '', args: []);
  }

  /// `Team Work`
  String get TeamWork {
    return Intl.message('Team Work', name: 'TeamWork', desc: '', args: []);
  }

  /// `1st Step`
  String get stStep {
    return Intl.message('1st Step', name: 'stStep', desc: '', args: []);
  }

  /// `Business Details `
  String get BusinessDetails {
    return Intl.message(
      'Business Details ',
      name: 'BusinessDetails',
      desc: '',
      args: [],
    );
  }

  /// `Mobile App`
  String get MobileApp {
    return Intl.message('Mobile App', name: 'MobileApp', desc: '', args: []);
  }

  /// `What is the timeline for launching the Project?`
  String get WhattimelinelaunchingtheProject {
    return Intl.message(
      'What is the timeline for launching the Project?',
      name: 'WhattimelinelaunchingtheProject',
      desc: '',
      args: [],
    );
  }

  /// `Print Outs`
  String get PrintOuts {
    return Intl.message('Print Outs', name: 'PrintOuts', desc: '', args: []);
  }

  /// `Size Requirements (e.g. standard, custom)?`
  String get SizeRequirements {
    return Intl.message(
      'Size Requirements (e.g. standard, custom)?',
      name: 'SizeRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Choose Size`
  String get ChooseSize {
    return Intl.message('Choose Size', name: 'ChooseSize', desc: '', args: []);
  }

  /// `write a comment`
  String get writecomment {
    return Intl.message(
      'write a comment',
      name: 'writecomment',
      desc: '',
      args: [],
    );
  }

  /// `all field must not be empty`
  String get Allfieldmustnotbeempty {
    return Intl.message(
      'all field must not be empty',
      name: 'Allfieldmustnotbeempty',
      desc: '',
      args: [],
    );
  }

  /// `Motion Graphic`
  String get MotionGraphic {
    return Intl.message(
      'Motion Graphic',
      name: 'MotionGraphic',
      desc: '',
      args: [],
    );
  }

  /// `What is the primary goal of this motion video?`
  String get Whatprimarygoalofvideo {
    return Intl.message(
      'What is the primary goal of this motion video?',
      name: 'Whatprimarygoalofvideo',
      desc: '',
      args: [],
    );
  }

  /// `what is the primary goal of motion graphic..`
  String get whatprimarygoalgraphic {
    return Intl.message(
      'what is the primary goal of motion graphic..',
      name: 'whatprimarygoalgraphic',
      desc: '',
      args: [],
    );
  }

  /// `Describe your ideal customer in detail (personality, behavior)?`
  String get Describeidealcustomer {
    return Intl.message(
      'Describe your ideal customer in detail (personality, behavior)?',
      name: 'Describeidealcustomer',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any specific typography or font styles in mind (e.g., serif, sans-serif, mono)?`
  String get Dohavespecificfontstyles {
    return Intl.message(
      'Do you have any specific typography or font styles in mind (e.g., serif, sans-serif, mono)?',
      name: 'Dohavespecificfontstyles',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any brand guidelines or style guides we should follow?`
  String get Dohavebrandguidelinesorstyleguides {
    return Intl.message(
      'Do you have any brand guidelines or style guides we should follow?',
      name: 'Dohavebrandguidelinesorstyleguides',
      desc: '',
      args: [],
    );
  }

  /// `What color palette do you prefer for your brand, and are there any colors to avoid?`
  String get Whatcolorpalettebrandcolorsavoid {
    return Intl.message(
      'What color palette do you prefer for your brand, and are there any colors to avoid?',
      name: 'Whatcolorpalettebrandcolorsavoid',
      desc: '',
      args: [],
    );
  }

  /// `What key messages or information do you want to convey?`
  String get Whatmessagestoconvey {
    return Intl.message(
      'What key messages or information do you want to convey?',
      name: 'Whatmessagestoconvey',
      desc: '',
      args: [],
    );
  }

  /// `Are there any specific text or phrases that must be included?`
  String get Aretherespecifictextorphrases {
    return Intl.message(
      'Are there any specific text or phrases that must be included?',
      name: 'Aretherespecifictextorphrases',
      desc: '',
      args: [],
    );
  }

  /// `Do you have a script or storyboard ready, or do you need assistance creating one?`
  String get Doscriptorstoryboardready {
    return Intl.message(
      'Do you have a script or storyboard ready, or do you need assistance creating one?',
      name: 'Doscriptorstoryboardready',
      desc: '',
      args: [],
    );
  }

  /// `You Can Choose Many`
  String get YouCanChooseMany {
    return Intl.message(
      'You Can Choose Many',
      name: 'YouCanChooseMany',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message('Yes', name: 'Yes', desc: '', args: []);
  }

  /// `No`
  String get No {
    return Intl.message('No', name: 'No', desc: '', args: []);
  }

  /// `Is there anything else you'd like to share about your vision for digital marketing?`
  String get Isthereaboutyourvisionfordigitalmarketing {
    return Intl.message(
      'Is there anything else you\'d like to share about your vision for digital marketing?',
      name: 'Isthereaboutyourvisionfordigitalmarketing',
      desc: '',
      args: [],
    );
  }

  /// `Ads and Campaigns Service`
  String get AdsService {
    return Intl.message(
      'Ads and Campaigns Service',
      name: 'AdsService',
      desc: '',
      args: [],
    );
  }

  /// `Ads and Campaigns`
  String get Ads {
    return Intl.message('Ads and Campaigns', name: 'Ads', desc: '', args: []);
  }

  /// `What social media platforms are most relevant for your business?`
  String get Whatsocialmediaplatformsaremostrelevantforyourbusiness {
    return Intl.message(
      'What social media platforms are most relevant for your business?',
      name: 'Whatsocialmediaplatformsaremostrelevantforyourbusiness',
      desc: '',
      args: [],
    );
  }

  /// `What are your business goals and objectives for digital marketing?`
  String get Whatareyourbusinessgoalsandobjectivesfordigitalmarketing {
    return Intl.message(
      'What are your business goals and objectives for digital marketing?',
      name: 'Whatareyourbusinessgoalsandobjectivesfordigitalmarketing',
      desc: '',
      args: [],
    );
  }

  /// `What is your budget for digital marketing efforts?`
  String get Whatisyourbudgetfordigitalmarketingefforts {
    return Intl.message(
      'What is your budget for digital marketing efforts?',
      name: 'Whatisyourbudgetfordigitalmarketingefforts',
      desc: '',
      args: [],
    );
  }

  /// `Do you have branding guidelines (colors, fonts, logos)?`
  String get Doyouhavebrandingguidelines {
    return Intl.message(
      'Do you have branding guidelines (colors, fonts, logos)?',
      name: 'Doyouhavebrandingguidelines',
      desc: '',
      args: [],
    );
  }

  /// `Type More Details`
  String get TypeMoreDetails {
    return Intl.message(
      'Type More Details',
      name: 'TypeMoreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Brand Identity`
  String get BrandIdentity {
    return Intl.message(
      'Brand Identity',
      name: 'BrandIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Will you be running paid advertising campaigns (Google Ads, Facebook Ads)?`
  String get Willyouberunningpaidadvertisingcampaigns {
    return Intl.message(
      'Will you be running paid advertising campaigns (Google Ads, Facebook Ads)?',
      name: 'Willyouberunningpaidadvertisingcampaigns',
      desc: '',
      args: [],
    );
  }

  /// `What is your unique selling proposition (USP)?`
  String get Whatisyouruniquesellingproposition {
    return Intl.message(
      'What is your unique selling proposition (USP)?',
      name: 'Whatisyouruniquesellingproposition',
      desc: '',
      args: [],
    );
  }

  /// `Digital Marketing`
  String get DigitalMarketing {
    return Intl.message(
      'Digital Marketing',
      name: 'DigitalMarketing',
      desc: '',
      args: [],
    );
  }

  /// `Motion graphic`
  String get Motiongraphic {
    return Intl.message(
      'Motion graphic',
      name: 'Motiongraphic',
      desc: '',
      args: [],
    );
  }

  /// `Crafting visually stunning animations that are dynamic and engaging.`
  String get Craftingvisuallystunninganimationsthataredynamicandengaging {
    return Intl.message(
      'Crafting visually stunning animations that are dynamic and engaging.',
      name: 'Craftingvisuallystunninganimationsthataredynamicandengaging',
      desc: '',
      args: [],
    );
  }

  /// `Creating high performance apps with the best user experience.`
  String get Creatinghighperformanceappswiththebestuserexperience {
    return Intl.message(
      'Creating high performance apps with the best user experience.',
      name: 'Creatinghighperformanceappswiththebestuserexperience',
      desc: '',
      args: [],
    );
  }

  /// `Creating sleek and easy to navigate websites.`
  String get Creatingsleekandeasytonavigatewebsites {
    return Intl.message(
      'Creating sleek and easy to navigate websites.',
      name: 'Creatingsleekandeasytonavigatewebsites',
      desc: '',
      args: [],
    );
  }

  /// `Grow your online presence at all times.`
  String get Growyouronlinepresenceatalltimes {
    return Intl.message(
      'Grow your online presence at all times.',
      name: 'Growyouronlinepresenceatalltimes',
      desc: '',
      args: [],
    );
  }

  /// `Designing ad campaigns that capture attention and get results.`
  String get Designingcampaignsthatcaptureattentionandgetresults {
    return Intl.message(
      'Designing ad campaigns that capture attention and get results.',
      name: 'Designingcampaignsthatcaptureattentionandgetresults',
      desc: '',
      args: [],
    );
  }

  /// `High-quality print materials that make a lasting impression.`
  String get Highqualityprintmaterialsthatmakealastingimpression {
    return Intl.message(
      'High-quality print materials that make a lasting impression.',
      name: 'Highqualityprintmaterialsthatmakealastingimpression',
      desc: '',
      args: [],
    );
  }

  /// `Creating memorable and powerful brands.`
  String get Creatingmemorableandpowerfulbrands {
    return Intl.message(
      'Creating memorable and powerful brands.',
      name: 'Creatingmemorableandpowerfulbrands',
      desc: '',
      args: [],
    );
  }

  /// `Describe the type of imagery you envision for your brand (e.g., illustrations, photographs, abstract graphics)?`
  String get Describeimageryyourbrand {
    return Intl.message(
      'Describe the type of imagery you envision for your brand (e.g., illustrations, photographs, abstract graphics)?',
      name: 'Describeimageryyourbrand',
      desc: '',
      args: [],
    );
  }

  /// `Are there specific design assets like images, fonts, illustrations that you've already produced or want to use?`
  String get Aretherespecificdesignassetsproducedor {
    return Intl.message(
      'Are there specific design assets like images, fonts, illustrations that you\'ve already produced or want to use?',
      name: 'Aretherespecificdesignassetsproducedor',
      desc: '',
      args: [],
    );
  }

  /// `How would you describe your brand's visual style (e.g., minimalist, sophisticated)?`
  String get Howdescribeyourbrand {
    return Intl.message(
      'How would you describe your brand\'s visual style (e.g., minimalist, sophisticated)?',
      name: 'Howdescribeyourbrand',
      desc: '',
      args: [],
    );
  }

  /// `What’s the Type of Print Service Needed (e.g. business cards, brochures, flyers, posters, etc.)?`
  String get WhatstheTypePrintServiceNeeded {
    return Intl.message(
      'What’s the Type of Print Service Needed (e.g. business cards, brochures, flyers, posters, etc.)?',
      name: 'WhatstheTypePrintServiceNeeded',
      desc: '',
      args: [],
    );
  }

  /// `Quantity Needed?`
  String get QuantityNeeded {
    return Intl.message(
      'Quantity Needed?',
      name: 'QuantityNeeded',
      desc: '',
      args: [],
    );
  }

  /// `Choose Quantity Range You need for your order`
  String get ChooseQuantity {
    return Intl.message(
      'Choose Quantity Range You need for your order',
      name: 'ChooseQuantity',
      desc: '',
      args: [],
    );
  }

  /// `or Type Your .Quantity Here|`
  String get orTypeYouQuantityHere {
    return Intl.message(
      'or Type Your .Quantity Here|',
      name: 'orTypeYouQuantityHere',
      desc: '',
      args: [],
    );
  }

  /// `Is any Preferred Paper Type (e.g. glossy, matte, recycled)?`
  String get IsanyPreferredPaperType {
    return Intl.message(
      'Is any Preferred Paper Type (e.g. glossy, matte, recycled)?',
      name: 'IsanyPreferredPaperType',
      desc: '',
      args: [],
    );
  }

  /// `Print Outs Service`
  String get PrintOutsService {
    return Intl.message(
      'Print Outs Service',
      name: 'PrintOutsService',
      desc: '',
      args: [],
    );
  }

  /// `Write Your business goals and objectives briefly..`
  String get WriteYourbusinessgoalsandobjectivesbriefly {
    return Intl.message(
      'Write Your business goals and objectives briefly..',
      name: 'WriteYourbusinessgoalsandobjectivesbriefly',
      desc: '',
      args: [],
    );
  }

  /// `write your unique selling proposition..`
  String get writeyouruniquesellingproposition {
    return Intl.message(
      'write your unique selling proposition..',
      name: 'writeyouruniquesellingproposition',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get RateApp {
    return Intl.message('Rate App', name: 'RateApp', desc: '', args: []);
  }

  /// `Dark`
  String get Dark {
    return Intl.message('Dark', name: 'Dark', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get TermsandConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'TermsandConditions',
      desc: '',
      args: [],
    );
  }

  /// `FeedBack`
  String get FeedBack {
    return Intl.message('FeedBack', name: 'FeedBack', desc: '', args: []);
  }

  /// `Cookies Policy`
  String get CookiesPolicy {
    return Intl.message(
      'Cookies Policy',
      name: 'CookiesPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Eng`
  String get Eng {
    return Intl.message('Eng', name: 'Eng', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Search for any thing`
  String get Searchforanything {
    return Intl.message(
      'Search for any thing',
      name: 'Searchforanything',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Requests`
  String get Requests {
    return Intl.message('Requests', name: 'Requests', desc: '', args: []);
  }

  /// `chat`
  String get chat {
    return Intl.message('chat', name: 'chat', desc: '', args: []);
  }

  /// `Bookmarks`
  String get Bookmarks {
    return Intl.message('Bookmarks', name: 'Bookmarks', desc: '', args: []);
  }

  /// `view Profile`
  String get viewProfile {
    return Intl.message(
      'view Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get OurServices {
    return Intl.message(
      'Our Services',
      name: 'OurServices',
      desc: '',
      args: [],
    );
  }

  /// `Nice to meet you!`
  String get Nicetomeetyou {
    return Intl.message(
      'Nice to meet you!',
      name: 'Nicetomeetyou',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get InProgress {
    return Intl.message('In Progress', name: 'InProgress', desc: '', args: []);
  }

  /// `example@email.com`
  String get example {
    return Intl.message(
      'example@email.com',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong try again`
  String get RetryAgain {
    return Intl.message(
      'Something went wrong try again',
      name: 'RetryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Email Send Check Your Email`
  String get EmailSendCheckyourEmail {
    return Intl.message(
      'Email Send Check Your Email',
      name: 'EmailSendCheckyourEmail',
      desc: '',
      args: [],
    );
  }

  /// `No requests found`
  String get Norequestsfound {
    return Intl.message(
      'No requests found',
      name: 'Norequestsfound',
      desc: '',
      args: [],
    );
  }

  /// `no requests`
  String get norequests {
    return Intl.message('no requests', name: 'norequests', desc: '', args: []);
  }

  /// `No comment yet!`
  String get Nocommentyet {
    return Intl.message(
      'No comment yet!',
      name: 'Nocommentyet',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get YourEmail {
    return Intl.message('Your Email', name: 'YourEmail', desc: '', args: []);
  }

  /// `Your Phone`
  String get YourPhone {
    return Intl.message('Your Phone', name: 'YourPhone', desc: '', args: []);
  }

  /// `City`
  String get City {
    return Intl.message('City', name: 'City', desc: '', args: []);
  }

  /// `Delete Your Account`
  String get DeleteYourAccount {
    return Intl.message(
      'Delete Your Account',
      name: 'DeleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Mobile App Service`
  String get MobileAppService {
    return Intl.message(
      'Mobile App Service',
      name: 'MobileAppService',
      desc: '',
      args: [],
    );
  }

  /// `Brand Identity Service`
  String get BrandIdentityService {
    return Intl.message(
      'Brand Identity Service',
      name: 'BrandIdentityService',
      desc: '',
      args: [],
    );
  }

  /// `Motion Graphic Service`
  String get MotionGraphicService {
    return Intl.message(
      'Motion Graphic Service',
      name: 'MotionGraphicService',
      desc: '',
      args: [],
    );
  }

  /// `Digital Marketing Service`
  String get DigitalMarketingService {
    return Intl.message(
      'Digital Marketing Service',
      name: 'DigitalMarketingService',
      desc: '',
      args: [],
    );
  }

  /// `Request Brief`
  String get RequestBrief {
    return Intl.message(
      'Request Brief',
      name: 'RequestBrief',
      desc: '',
      args: [],
    );
  }

  /// `What is the timeline for launching the Application?`
  String get WhattimelinelaunchingApplication {
    return Intl.message(
      'What is the timeline for launching the Application?',
      name: 'WhattimelinelaunchingApplication',
      desc: '',
      args: [],
    );
  }

  /// `Will you provide high-resolution \nimages for the Application?`
  String get WillprovidehighresolutionApplication {
    return Intl.message(
      'Will you provide high-resolution \\nimages for the Application?',
      name: 'WillprovidehighresolutionApplication',
      desc: '',
      args: [],
    );
  }

  /// `Which platforms do you want to target (iOS, Android, both)?`
  String get WhichplatformstargetiOSAndroidboth {
    return Intl.message(
      'Which platforms do you want to target (iOS, Android, both)?',
      name: 'WhichplatformstargetiOSAndroidboth',
      desc: '',
      args: [],
    );
  }

  /// `Is there anything else you\'d like to share about your vision for digital marketing?`
  String
  get Isthereanythingelseyoudliketoshareaboutourvisionfordigitalmarketing {
    return Intl.message(
      'Is there anything else you\\\'d like to share about your vision for digital marketing?',
      name:
          'Isthereanythingelseyoudliketoshareaboutourvisionfordigitalmarketing',
      desc: '',
      args: [],
    );
  }

  /// `Where will your brand be used (website, social media, print materials)?`
  String get Whereyourbrandbeused {
    return Intl.message(
      'Where will your brand be used (website, social media, print materials)?',
      name: 'Whereyourbrandbeused',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
