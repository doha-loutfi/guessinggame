all: README.md

README.md: guessinggame.sh
	@echo "# Jeu de devinettes - Bash, Make, Git et GitHub" > README.md
	@echo "" >> README.md
	@echo "- **Date et heure d'exécution de make :** $$(date '+%d/%m/%Y à %H:%M:%S')" >> README.md
	@echo "- **Nombre de lignes de code dans guessinggame.sh :** $$(wc -l < guessinggame.sh)" >> README.md

clean:
	rm -f README.md

.PHONY: all clean
