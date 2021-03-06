# BookInfoMagerクラスを定義する
require 'date'

class BookInfo
  # Bookinfoクラスのインスタンスを初期化する
  def initialize( title, author, page, publish_date )
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  # 最初に検討する属性に対するアクセサを提供する
  attr_accessor :title, :author, :page, :publish_date

  # Bookinfoクラスのインスタンスの文字列表現を返す
  def to_s
    "#{@title}, #{@author}, #{@page}, #{@publish_date}"
  end

  # 蔵書データを書式をつけて出力する操作を追加する
  # 項目の区切り文字を引数に指定することができる
  # 引数を省略した場合は改行を区切り文字にする
  def toFormattedString( sep = "\n" )
    "書籍名: #{@title}#{sep}著者名: #{@author}#{sep}ページ数: #{@page}ページ#{sep}発刊日: #{@publish_date}#{sep}"
  end
end

class BookInfoManager
    def initialize
        @book_infos = {}
    end

    # 蔵書データをセットアップする
    def setUp
        # 複数冊の蔵書データを登録する
        @book_infos["Yamada2005"] = BookInfo.new(
            "実践アジャイル ソフトウェア開発法とプロジェクト管理",
            "山田 正樹",
            248,
            Date.new(2005, 1, 25)
        )
        @book_infos["Ooba2006"] = BookInfo.new(
            "入門LEGO MINDSTORMS NXT レゴブロックで作る動くロボット",
            "大庭 慎一郎",
            164,
            Date.new(2006, 12, 23)
        )
    end

    # 処理の選択と選択後の処理を繰り返す
    def run
        while true
            # 機能選択画面を表示する
            print "
                1. 蔵書データの登録
                2. 蔵書データの表示
                9. 読了
                番号を選んでください（1,2,9）:"
            
            # 文字の入力を待つ
            num = gets.chomp
            case
            when '1' == num
                # 蔵書データの登録
                addBookInfo
            when '2' == num
                # 蔵書データの表示
                listAllBookInfos
            when '9' == num
                # アプリケーションの終了
                break;
            else
                # 処理選択町画面に戻る
            end
        end
    end

    # 蔵書データを登録する
    def addBookInfo
        book_info = BookInfo.new("", "", 0, Date.new)
        print "\n"
        print "キー: "
        key = gets.chomp
        print "書籍名: "
        book_info.title = gets.chomp
        print "著者名: "
        book_info.author = gets.chomp
        print "ページ数: "
        book_info.page = gets.chop.to_i
        print "発刊年: "
        year = gets.chomp.to_i
        print "発刊月: "
        month = gets.chomp.to_i
        print "発刊日: "
        day = gets.chomp.to_i
        book_info.publish_date = Date.new(year, month, day)
        @book_infos[key] = book_info
    end

    # 蔵書データの一覧を表示する
    def listAllBookInfos
        puts "\n---------------"
        @book_infos.each {|key, info|
            print info.toFormattedString
            puts "\n--------------"
        }
    end

end

book_info_manager = BookInfoManager.new
book_info_manager.setUp
book_info_manager.run
