import 'package:intl/intl.dart';

class StringUtils {
  // static String getBaseUrl({bool useV2Url = false}) {
  //   String mode = Global.mode;
  //   String baseUrl = mode == ConstantString.stagingMode
  //       ? 'https://staging.api.mycover.ai'
  //       : 'https://api.mycover.ai';
  //   return useV2Url ? '$baseUrl/v2' : '$baseUrl/v1';
  // }

  static String getProviderPeriodOfCover(String periodOfCover) {
    return periodOfCover == "12" ? "Anumm" : "Month";
  }

  static String getProductPrice(String price, bool isDynamic) {
    return isDynamic
        ? "${formatDynamicPrice(price)}%"
        : "₦ ${formatPriceWithComma(price)} ";
  }

  static String formatCustomDate(DateTime? date) {
    date ??= DateTime.now(); // Use today's date if the date is null
    String day = DateFormat('d').format(date);
    String suffix = getDaySuffix(int.parse(day));
    String formattedDate = DateFormat("d'$suffix' MMMM yyyy").format(date);
    return formattedDate;
  }

  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String formatDynamicPrice(String priceString) {
    double price = double.tryParse(priceString) ?? 0.0;
    String formattedPrice = price.toStringAsFixed(2);

    if (formattedPrice.endsWith('.00')) {
      return formattedPrice.substring(
          0, formattedPrice.length - 3); // Remove the '.00'
    } else {
      return formattedPrice;
    }
  }

  static String? formatPriceWithComma(String? priceString) {
    if (priceString == null) {
      return null;
    } else {
      double price = double.tryParse(priceString) ?? 0.0;
      // Check if the price is an integer (i.e., has no decimal part)
      bool isInteger = price == price.toInt();

      // Format the price with commas, and optionally with decimal places
      final NumberFormat numberFormat = NumberFormat.currency(
        locale: 'en_US',
        decimalDigits:
            isInteger ? 0 : 2, // 0 decimal places if integer, 2 if not
        symbol: '',
      );
      return numberFormat.format(price);
    }
  }

  static bool isNullOrEmptyList(List? list) {
    return list == null || list.isEmpty;
  }

  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static String getFirstTwoCharsCapitalized(String? input) {
    if (input == null || input.isEmpty) {
      return "";
    }
    String firstTwoChars =
        input.substring(0, input.length >= 2 ? 2 : input.length);
    return firstTwoChars.toUpperCase();
  }

  static String getFirstCharCapitalized(String? input) {
    if (input == null || input.isEmpty) {
      return "";
    }
    String firstChar = input.substring(0, 1);
    return firstChar.toUpperCase();
  }
}
