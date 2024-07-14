import 'package:aws_models/aws_models.dart';

/// Mock [HtmlContent] data. For testing purposes only.
const htmlContent =
    HtmlContent(data: '<html><body><h1>Hello, world!</h1></body></html>');

/// Mock [HtmlContent] data. For testing purposes only.
const textContent = TextContent(data: 'Hello, world!');

/// Mock [Subject] data. For testing purposes only.
const subject = Subject(data: 'Hello');

/// Mock [Header] data. For testing purposes only.
const header = Header(name: 'Hello', value: 'World');

/// Mock [Destination] data. For testing purposes only.
const destination = Destination(toAddresses: ['email@example.com']);

/// Mock [EmailTag] data. For testing purposes only.
const emailTag = EmailTag(name: 'Hello', value: 'World');

/// Mock [ListManagementOptions] data. For testing purposes only.
const listManagementOptions = ListManagementOptions(
  contactListName: 'email@example.com',
  topicName: 'Hello World',
);
