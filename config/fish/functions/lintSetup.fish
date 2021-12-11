function _addPrettier
    set PRETTIER "prettier "
    # yarn add $PRETTIER --dev
end
function _addEslint
    set ESLINT "eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-css-modules eslint-plugin-react eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react-hooks"
    # echo "yarn add $ESLINT --dev"
    yarn add (echo $ESLINT) --dev
    if test -f tsconfig.json
        set ESLINTTS "@typescript-eslint/eslint-plugin@4.33.0 @typescript-eslint/parser eslint-import-resolver-typescript"
        # yarn add $ESLINTTS --dev
    end
end
function _addStyleLint
    set STYLELINT ""
    # yarn add $STYLELINT --dev
end

function lintSetup
    set BASEFILES $HOME/Documents/Proj/Github/templateFiles/linting

    set PRETTIER_IGNORE_FILE "$BASEFILES/.prettierignore"
    set PRETTIER_FILE "$BASEFILES/.prettierrc.json"

    set ESLINT_IGNORE_FILE "$BASEFILES/.eslintignore"
    set ESLINT_FILE "$BASEFILES/.eslintrc.json"
    set ESLINT_TS_FILE "$BASEFILES/.ts.eslintrc.json"

    # set STYLELINT_FILE "$BASEFILES/.stylelintrc.json"
    # set STYLELINT_IGNORE_FILE "$BASEFILES/.stylelintignore"

    set LINTSTAGED_FILE "$BASEFILES/.lintstagedrc.json"

    _addPrettier
    # cp $PRETTIER_FILE ./
    # cp $PRETTIER_IGNORE_FILE ./
    _addEslint
    # cp $ESLINT_IGNORE_FILE ./
    if test -f tsconfig.json
        echo "Typescript project detected \n"
        # cp $ESLINT_TS_FILE ./.eslintrc.json
    else
        # cp $ESLINT_FILE ./
    end
    # _addStyleLint
    # cp $STYLELINT_FILE ./
    # cp $STYLELINT_IGNORE_FILE ./

    # Add lint staged to the project
    echo "npx mrm@2 lint-staged"
    # cp $LINTSTAGED_FILE ./
end
