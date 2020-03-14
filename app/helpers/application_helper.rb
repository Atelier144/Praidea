module ApplicationHelper
    def default_meta_tags
        {
            site: "Praidea",
            title: "ひらめき褒め褒めSNS",
            reverse: true,
            charset: "utf-8",
            description: "Praideaはひらめきを投稿し、ひらめきを褒め合うSNSです。",
            icon:[
                {
                    href: image_url("favicon.ico")
                }
            ],
            viewport: "width=device-width, initial-scale=1.0"
        }
    end
end
