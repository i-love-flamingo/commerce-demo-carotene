FROM docker.io/aoepeople/scratch-go-env

ADD frontend/dist /frontend/dist
ADD frontend/src /frontend/src
ADD flamingo-commerce-demo-carotene /flamingo-commerce-demo-carotene
ADD config /config
ADD translations /translations
ADD ressources /ressources
ENTRYPOINT ["/flamingo-commerce-demo-carotene"]
CMD ["serve"]
