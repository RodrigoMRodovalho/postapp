// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// You read all comments
  internal static let allCommentsRead = Strings.tr("Localizable", "all_comments_read")
  /// You read all posts
  internal static let allPostRead = Strings.tr("Localizable", "all_post_read")
  /// Comments
  internal static let comments = Strings.tr("Localizable", "comments")
  /// CommentCell
  internal static let commentTableViewCellIdentifier = Strings.tr("Localizable", "commentTableViewCellIdentifier")
  /// CommentTableViewCell
  internal static let commentTableViewCellName = Strings.tr("Localizable", "commentTableViewCellName")
  /// Swipe down to retry
  internal static let errorRetryText = Strings.tr("Localizable", "error_retry_text")
  /// Something whent wrong.
  internal static let errorTitle = Strings.tr("Localizable", "error_title")
  /// Likes
  internal static let likes = Strings.tr("Localizable", "likes")
  /// No comments yet
  internal static let noCommentsAvailable = Strings.tr("Localizable", "no_comments_available")
  /// No post yet
  internal static let noPostAvailable = Strings.tr("Localizable", "no_post_available")
  /// Posts
  internal static let posts = Strings.tr("Localizable", "posts")
  /// PostCell
  internal static let postTableViewCellIdentifier = Strings.tr("Localizable", "postTableViewCellIdentifier")
  /// PostTableViewCell
  internal static let postTableViewCellName = Strings.tr("Localizable", "postTableViewCellName")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
