# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: muhakose <muhakose@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/04 13:16:16 by muhakose          #+#    #+#              #
#    Updated: 2024/03/04 17:09:52 by muhakose         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:

COLOUR_DEFAULT = \033[0m
COLOUR_BLACK = \033[0;30m
COLOUR_RED = \033[0;31m
COLOUR_GREEN = \033[0;32m
COLOUR_YELLOW = \033[0;33m
COLOUR_BLUE = \033[0;34m
COLOUR_MAGENTA = \033[0;35m
COLOUR_CYAN = \033[0;36m
COLOUR_WHITE = \033[0;37m
COLOUR_BOLD = \033[1m
COLOUR_UNDERLINE = \033[4m
COLOUR_END = \033[0m

CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror -I./include/ -g

OBJ_DIR = obj
OBJ = obj/main.o \
	obj/utils/error.o \
	obj/utils/freearr.o \
	obj/utils/ft_realloc.o \
	obj/utils/ft_strndup.o \
	obj/utils/get_env.o \
	obj/utils/join_char.o \
	obj/utils/length_utils.o \
	obj/utils/signals_and_config.o \
	obj/utils/skip_functions.o \
	obj/utils/syntax.o \
	obj/utils/tokens_and_check.o \
	obj/parsing/dollar.o \
	obj/parsing/double_quotes.o \
	obj/parsing/input_heredoc.o \
	obj/parsing/linked_list.o \
	obj/parsing/parse.o \
	obj/parsing/redirection_helper.o \
	obj/parsing/redirection.o \
	obj/parsing/single_quotes.o \
	obj/execution/clear.o \
	obj/execution/directions_exec.o \
	obj/execution/dup_functions.o \
	obj/execution/exec.o \
	obj/execution/get_adres.o \
	obj/execution/opener.o \
	obj/execution/piper.o \
	obj/execution/utils.o \
	obj/builtins/builtins.o \
	obj/builtins/ft_cd_helper.o \
	obj/builtins/ft_cd.o \
	obj/builtins/ft_exit.o \
	obj/builtins/ft_export_3.o \
	obj/builtins/ft_export_helper.o \
	obj/builtins/ft_export.o \
	obj/builtins/ft_pwd_ft_env.o \
	obj/builtins/ft_unset.o \

NAME = minishell

LIBFTDIR = libft
LIBFT = $(LIBFTDIR)/libft.a

$(NAME) : $(OBJ_DIR) $(OBJ) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT) $(LDFLAGS) -o $(NAME) -lreadline
	echo "$(COLOUR_MAGENTA)Minishell compiled successfully!$(COLOUR_END)"

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)/utils
	mkdir -p $(OBJ_DIR)/parsing
	mkdir -p $(OBJ_DIR)/builtins
	mkdir -p $(OBJ_DIR)/execution

$(OBJ_DIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT):
	make -C $(LIBFTDIR) && make clean -C $(LIBFTDIR)

all : $(NAME)

clean:
	$(RM) -rf $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)
	make fclean -C $(LIBFTDIR)
	echo "$(COLOUR_MAGENTA)$(COLOUR_UNDERLINE)Minishell cleaned successfully!$(COLOUR_END)"

re: fclean all


.PHONY: all clean fclean re
