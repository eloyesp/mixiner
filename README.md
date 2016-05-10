# Mixiner

Help gem builders to define methods with metaprograming making sure they get
trapped in a mixin module.

For example, when adding methods like:

- ActiveModel attributes
- ActiveRecord associations
- Carrierwave mounts
- PaperClip attachments

You use a class method to define a bunch of instance methods in your class, but
those methods pollute your class unless you build a specific mixin for them
(ActiveRecord actually do that), this allows you to overwrite some of those
methods and call super on them to fall back to the default functionality (which
is not possible if you define the method in the class itself).

## Usage

This is a Work in Progress, so just check the [example.rb](/example.rb).
