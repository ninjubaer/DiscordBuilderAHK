#Include DiscordBuilder.ahk
#Requires AutoHotkey v2.0 

webhook := Discord.Webhook("<WEBHOOK_URL>") ;--- Replace with webhook url

image := AttachmentBuilder("banner.jpg")
thumbnail := AttachmentBuilder("avatar.jpg")
embed := EmbedBuilder()
embed.setTitle("example title")
embed.setDescription("example description")
embed.setURL("https://github.com/ninjubaer")
embed.setAuthor({name:"ninju",icon_url:thumbnail.attachmentName,url:"https://github.com/ninjubaer"})
embed.setColor(0xFFFFFF)
embed.addFields([
   {
      name:"First Field",
      value: "value of first field"
   },
   {
      name: "Second Field",
      value: "value of second field",
      inline: true
   },
   {
      name: "Third Field",
      value: "value of third field",
      inline: true
   }
])
embed.setFooter({text:"DiscordBuilder.ahk by ninju"})
embed.setThumbnail({url:thumbnail.attachmentName})
embed.setImage({url:image.attachmentName || "attachment://banner.jpg"}) ; or "attachment://filename.extension"
embed.setTimeStamp() ;empty = now ; else the format is: YYYY-MM-DDTHH:MM:SS.000Z
webhook.send({
   embeds: [embed],
   files: [image,thumbnail]
})
msgbox webhook.response