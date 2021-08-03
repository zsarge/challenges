// https://www.codewars.com/kata/57eae20f5500ad98e50002c5/train/go

package kata

import (
	"strings"
)

func NoSpace(word string) string {
  return strings.Replace(word, " ", "", -1)
}
