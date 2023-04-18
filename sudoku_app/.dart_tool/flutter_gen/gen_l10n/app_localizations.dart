import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_et.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('et'),
    Locale('ru')
  ];

  /// No description provided for @colorScheme.
  ///
  /// In en, this message translates to:
  /// **'Color scheme'**
  String get colorScheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @highContrastTheme.
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get highContrastTheme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @sudokuRules.
  ///
  /// In en, this message translates to:
  /// **'Sudoku rules'**
  String get sudokuRules;

  /// No description provided for @lastRemainingCell.
  ///
  /// In en, this message translates to:
  /// **'Last remaining cell'**
  String get lastRemainingCell;

  /// No description provided for @lastPossibleNumber.
  ///
  /// In en, this message translates to:
  /// **'Last possible number'**
  String get lastPossibleNumber;

  /// No description provided for @hintCanNotBeSolved.
  ///
  /// In en, this message translates to:
  /// **'This Sudoku can\'t be solved with known techniques'**
  String get hintCanNotBeSolved;

  /// No description provided for @hintCanBeSolvedUsingSingleCell.
  ///
  /// In en, this message translates to:
  /// **'Technique can be applied to the highlighted cell: '**
  String get hintCanBeSolvedUsingSingleCell;

  /// No description provided for @hintCanBeSolvedUsingMultipleCells.
  ///
  /// In en, this message translates to:
  /// **'Technique can be applied to the highlighted cells: '**
  String get hintCanBeSolvedUsingMultipleCells;

  /// No description provided for @nakedSingle.
  ///
  /// In en, this message translates to:
  /// **'Naked singles'**
  String get nakedSingle;

  /// No description provided for @nakedPair.
  ///
  /// In en, this message translates to:
  /// **'Naked pairs'**
  String get nakedPair;

  /// No description provided for @nakedTriple.
  ///
  /// In en, this message translates to:
  /// **'Naked triples'**
  String get nakedTriple;

  /// No description provided for @hiddenSingle.
  ///
  /// In en, this message translates to:
  /// **'Hidden singles'**
  String get hiddenSingle;

  /// No description provided for @hiddenPair.
  ///
  /// In en, this message translates to:
  /// **'Hidden pairs'**
  String get hiddenPair;

  /// No description provided for @hiddenTriple.
  ///
  /// In en, this message translates to:
  /// **'Hidden triples'**
  String get hiddenTriple;

  /// No description provided for @pointingPair.
  ///
  /// In en, this message translates to:
  /// **'Pointing pairs'**
  String get pointingPair;

  /// No description provided for @pointingTriple.
  ///
  /// In en, this message translates to:
  /// **'Pointing triples'**
  String get pointingTriple;

  /// No description provided for @xwing.
  ///
  /// In en, this message translates to:
  /// **'X-wing'**
  String get xwing;

  /// No description provided for @ywing.
  ///
  /// In en, this message translates to:
  /// **'Y-wing'**
  String get ywing;

  /// No description provided for @swordfish.
  ///
  /// In en, this message translates to:
  /// **'Swordfish'**
  String get swordfish;

  /// No description provided for @fillCandidates.
  ///
  /// In en, this message translates to:
  /// **'Fill pencil marks'**
  String get fillCandidates;

  /// No description provided for @newGame.
  ///
  /// In en, this message translates to:
  /// **'New game'**
  String get newGame;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @veryHard.
  ///
  /// In en, this message translates to:
  /// **'Very hard'**
  String get veryHard;

  /// No description provided for @menuItemGame.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get menuItemGame;

  /// No description provided for @menuItemLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get menuItemLearning;

  /// No description provided for @menuItemSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuItemSettings;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @navigationMenuOption.
  ///
  /// In en, this message translates to:
  /// **'Navigation menu'**
  String get navigationMenuOption;

  /// No description provided for @adaptive.
  ///
  /// In en, this message translates to:
  /// **'Adaptive'**
  String get adaptive;

  /// No description provided for @bottomNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get bottomNavigationBar;

  /// No description provided for @sidebar.
  ///
  /// In en, this message translates to:
  /// **'Sidebar'**
  String get sidebar;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// No description provided for @pencilMarks.
  ///
  /// In en, this message translates to:
  /// **'Pencil marks'**
  String get pencilMarks;

  /// No description provided for @basics.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get basics;

  /// No description provided for @beginnerTechniques.
  ///
  /// In en, this message translates to:
  /// **'Beginner techniques'**
  String get beginnerTechniques;

  /// No description provided for @intermediateTechniques.
  ///
  /// In en, this message translates to:
  /// **'Intermediate techniques'**
  String get intermediateTechniques;

  /// No description provided for @advancedTechniques.
  ///
  /// In en, this message translates to:
  /// **'Advanced techniques'**
  String get advancedTechniques;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @seeBasics.
  ///
  /// In en, this message translates to:
  /// **'Would you like to see Sudoku rules first?'**
  String get seeBasics;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, please'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'I know the rules'**
  String get no;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @youWon.
  ///
  /// In en, this message translates to:
  /// **'You solved the puzzle!'**
  String get youWon;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @sudokuRulesDescription1.
  ///
  /// In en, this message translates to:
  /// **'Sudoku is a logic game that consists of a 9x9 grid divided into 3x3 regions or blocks, where some of the squares are filled with numbers.'**
  String get sudokuRulesDescription1;

  /// No description provided for @sudokuRulesDescription2.
  ///
  /// In en, this message translates to:
  /// **'To solve Sudoku, you have to fill in the empty cells with numbers.'**
  String get sudokuRulesDescription2;

  /// No description provided for @sudokuRulesDescription3.
  ///
  /// In en, this message translates to:
  /// **'Sudoku is considered correctly solved if all the cells are filled in according to the rules. \nThe rules are as follows: \n - all rows, columns and blocks must contain numbers from 1 to 9 \n - numbers cannot be repeated in any row, column or block.'**
  String get sudokuRulesDescription3;

  /// No description provided for @sudokuRulesDescription4.
  ///
  /// In en, this message translates to:
  /// **'Rows, columns and blocks can all be referred to as groups. \nUsing these rules it is possible to find the values of some cells. If there is only one empty cell left in a group, then the only number 1-9 that is not in the group can be placed there immediately.\nFor example, the block below contains all numbers except 7. Therefore, the empty square can be filled with 7.'**
  String get sudokuRulesDescription4;

  /// No description provided for @solvePuzzleLearning.
  ///
  /// In en, this message translates to:
  /// **'Now you apply the new knowledge to solve this problem:'**
  String get solvePuzzleLearning;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'et', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'et': return AppLocalizationsEt();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
