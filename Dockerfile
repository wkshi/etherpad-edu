FROM docker.io/etherpad/etherpad:latest

USER root

RUN apt update -y && apt -y install vim

USER etherpad

WORKDIR /opt/etherpad-lite

RUN npm install ep_headings2 ep_markdown ep_align ep_font_color ep_embedded_hyperlinks2 \
    ep_print ep_readonly_guest ep_delete_empty_pads ep_adminpads2 ep_tables4 ep_image_upload ep_prompt_for_name
