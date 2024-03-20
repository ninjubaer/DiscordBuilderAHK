# DiscordBuilderAHK
An easy to use discord webhook builder
Inspired by the EmbedBuilder from the discord.js library
## Docs
- [Initializing](#initializing)
- [EmbedBuilder](#embedbuilder)
- [Embed Builder Methods](#embedbuilder-methods)
- [Creating Attachments](#attachmentbuilder)
- [Using Attachments In Embed Fields](#attachments-in-embeds)
___
&nbsp;


## Initializing
```ahk
Webhook := Discord.Webhook(
  "https://discord.com/api/webhooks/123456789012345678/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
)
```
the Discord.Webhook() requires your webhook url as a parameter
___

## EmbedBuilder
Discord embeds enhance messages with structured content,\
including text, images, and links, improving communication by providing context and visual appeal.

The EmbedBuilder simplifies the process of creating rich embeds for discord webhook.
Inspired by the syntax of discordjs' EmbedBuilder

create a new Embed like this:
```ahk
Embed := EmbedBuilder()
```
___
&nbsp;
## EmbedBuilder methods
Discord embeds have multiple contents:
- Title
- Description
- Color
- Field(s)
- URL
- Author
- Footer
- TimeStamp
- Thumbnail
- Image

with the EmbedBuilder() you can add all of those easily.
&nbsp;
**.setTitle()**
```ahk
embed.setTitle("example title")
```
___
**.setDescription()**
```ahk
embed.setDescription("example description")
```
___
**.setColor()**
```ahk
embed.setColor(0xFFFFFF)
```
or
```ahk
embed.setColor(16777215)
```
___
**.addFields()**
since we can have multiple fields in an embed, the parameter is an array:
```ahk
embed.addFields([
  {
    name:"Field1",
    value: "Value of field1",
    inline: true
  },
  {
    name: "Field2",
    value: "value of field2",
    inline: true
  }
])
```
___
**.setURL()**
```ahk
embed.setURL("https://github.com/ninjubaer/DiscordBuilderAHK")
```
___
**.setAuthor()**
```ahk
embed.setAuthor({
  name: "example name",
  icon_url: "https://..."
})
```
___
**.setFooter()**
```ahk
embed.setFooter({
  text: "DiscordBuilder.ahk by ninju"
})
```
___
**.setTimestamp()**
sets the timestamp to embed.now()
```ahk
embed.setTimestamp()
```
or
```ahk
embed.setTimestamp("1970-01-01T00:00:00.000Z")
```
___
**.setThumbnail()** and **.setImage()**
```
embed.setThumbnail({url:"https://..."})
embed.setImage({url:"https://..."})
```
___
&nbsp;
## AttachmentBuilder
The AttachmentBuilder creates an attachment which you can then send through the webhook
For example:
```ahk
Attachment := AttachmentBuilder("config.ini")
```
The parameter path needs to be a relative path to your A_WorkingDir.
Make sure to use
```ahk
SetWorkingDir(A_ScriptDir)
```
if you want to use that
___
&nbsp;
### Attachments in Embeds
The attachments you create with the [AttachmentBuilder](#attachmentbuilder)\
can also be used in fields of the [EmbedBuilder](#embedbuilder) that require an url.
For example:
```ahk
image := AttachmentBuilder("banner.jpg")
embed.setImage(image.attachmentName)
```
same thing works with thumbnail.url, author.icon_url or footer.icon_url
___
&bnsp;

## Sending the Webhook
We can send messages to discord webhook like this (only after [initializing](#initializing):
```ahk
Webhook.Send({
  content: "this is a message"
})
```

Now if we wanted to send embed(s) (yes you can send multiple!) we do that:
```ahk
Webhook.Send({
  Embeds: [embed]
})
```
if you want multiple embeds just add them in the array.

If you want to add attachments or have attachments in the embed, we need to add those to the object:
```ahk
Webhook.Send({
  embeds: [embed],
  files: [image]
}
```
Pro Tipp:
use "<@" userID ">" in content to get pinged from the webhook


## Credits:
CreateFormData by Timplishi converted to v2 and edited by me
