class VotedJokeIdsFromCookies
  COOKIES_VOTED_REGEX = /vote-for-.*/.freeze
  COOKIES_KEY_SEPERATOR = '-'.freeze

  def initialize(cookies)
    @cookies = cookies
  end

  def ids
    pick_voted_keys(@cookies).map { |ite| last_part_of_key(ite[0]) }
  end

  private

  def pick_voted_keys(cookies)
    cookies.select { |key, value| key.match(COOKIES_VOTED_REGEX) }
  end

  def last_part_of_key(key)
    key.split(COOKIES_KEY_SEPERATOR)[-1]
  end
end
