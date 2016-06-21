var fs = require('fs');
var bf = require('bloomfilter');

var inputFilename = process.argv[2];
var outputFilename = process.argv[3];
var numberOfHashes = process.argv[4];
var numberOfBits = process.argv[5];

if (! (inputFilename && outputFilename)) {
  console.error('usage: node plaintext2bloom.js <input filename> <output filename> [<number of hashes>]');
  return 1;
}

fs.readFile(inputFilename, 'utf8', function (err, data) {
  if (err) {
    return console.log(err);
  }

  var s = data.split('\n');
  var bloom = new bf.BloomFilter(
    numberOfBits * s.length,  // number of bits to allocate per item
    numberOfHashes  // number of hash functions.
  );

  s.forEach(function(pwd){
    bloom.add(pwd);
  });

  fs.writeFile(outputFilename, bloom.serialize());
});
