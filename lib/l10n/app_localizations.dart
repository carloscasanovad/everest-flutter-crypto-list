import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// A.K.A NFT
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// User cryptos balance in R$
  ///
  /// In en, this message translates to:
  /// **'Total balance:'**
  String get userBalance;

  /// Details appBar title
  ///
  /// In en, this message translates to:
  /// **'Details:'**
  String get details;

  /// Text for button to convert crypto
  ///
  /// In en, this message translates to:
  /// **'Convert crypto'**
  String get convertCrypto;

  /// Text for the current crypto price
  ///
  /// In en, this message translates to:
  /// **'Current price'**
  String get currentPrice;

  /// Price variation in %
  ///
  /// In en, this message translates to:
  /// **'Change %'**
  String get priceVariation;

  /// User crypto balance
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get userCryptoQuantity;

  /// User crypto value
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get userCryptoValue;

  /// Exchange appBar title
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// Estimated exchange value
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// exchange page title
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get exchangeTitle;

  /// default text for insufficient funds
  ///
  /// In en, this message translates to:
  /// **'Insufficient funds!'**
  String get insufficientFunds;

  /// user crypto balance for an specific crypto
  ///
  /// In en, this message translates to:
  /// **'Total balance:'**
  String get totalBalance;

  /// confirm appBar Title
  ///
  /// In en, this message translates to:
  /// **'Confirm conversion'**
  String get confirm;

  /// confirm page Title
  ///
  /// In en, this message translates to:
  /// **'Confirm your conversion'**
  String get confirmTitle;

  /// default text for convert button
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// default text for pay with
  ///
  /// In en, this message translates to:
  /// **'Pay with'**
  String get payWith;

  /// default text for receive
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// exchange rate text
  ///
  /// In en, this message translates to:
  /// **'Exchange rate'**
  String get exchangeRate;

  /// transactions appBar title
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactionsAppBar;

  /// portfolio text for navBar
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// transactions text for navBar
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @successTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversion completed'**
  String get successTitle;

  /// No description provided for @successSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your conversion was successfully completed!'**
  String get successSubtitle;

  /// Transaction bill title
  ///
  /// In en, this message translates to:
  /// **'Bill of'**
  String get transactionBillTitle;

  /// Transaction bill subtitle
  ///
  /// In en, this message translates to:
  /// **'exchange'**
  String get transactionBillSubtitle;

  /// quantity converted text
  ///
  /// In en, this message translates to:
  /// **'Quantity converted'**
  String get quantityConverted;

  /// quantity receive text
  ///
  /// In en, this message translates to:
  /// **'Quantity receive'**
  String get quantityReceive;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
